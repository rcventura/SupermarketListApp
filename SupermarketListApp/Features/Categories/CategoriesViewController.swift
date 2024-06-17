//
//  CategoriesViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let mainView: CategoriesView = .init()
    var viewModel: CategoriesViewModel
    var placeOfCreation: Bool
    var categoriesList: [ListCategoriesModel] = [] {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    init(viewModel: CategoriesViewModel, placeOfCreation: Bool) {
        self.viewModel = viewModel
        self.placeOfCreation = placeOfCreation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
        viewModel.getCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCategory()
    }
}

extension CategoriesViewController {
    private func delegates() {
        viewModel.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    
    @objc private func backViewController() {
        dismiss(animated: true)
    }
}

extension CategoriesViewController: CategoriesViewModelDelegate {
    func didFetchData() {
        self.categoriesList = viewModel.category
    }
    
    func didError(message: String) {
        showSimpleAlert(title: "Atenção", message: message)
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath)
        let categoryName = viewModel.category[indexPath.row].nameCategories
        let categoryImage = viewModel.category[indexPath.row].image.name
        
        if let cell = cell as? CategoriesCollectionViewCell {
            cell.categoryImage.image = UIImage(named: categoryImage )
            cell.categoryTitle.text = categoryName
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryId = viewModel.category[indexPath.item].id
        self.dismiss(animated: false)
        self.viewModel.openCategoryItemList(categoryId: categoryId, placeOfCreation: self.placeOfCreation)
    }
}

extension CategoriesViewController {
    private func addLayout() {
        delegates()
        title = "Categorias"
        navigationController?.navigationBar.backgroundColor = SMColor.blue_BDD1DE
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Fechar", style: .plain, target: self, action: #selector(backViewController))
    }
}
