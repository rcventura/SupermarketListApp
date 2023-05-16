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
    
    init(viewModel: CategoriesViewModel) {
        self.viewModel = viewModel
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCategory()
    }
}

extension CategoriesViewController {
    private func delegates() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath)
        let categoryName = viewModel.category[indexPath.row].title
        
        if let cell = cell as? CategoriesCollectionViewCell {
            cell.categoryTitle.text = categoryName
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let categoryId = viewModel.category[indexPath.item].id else { return }
        self.dismiss(animated: false)
        self.viewModel.openCategoryItemList(categoryId: categoryId)
    }
}

extension CategoriesViewController {
    private func addLayout() {
        delegates()
        title = "Categorias"
        navigationController?.navigationBar.backgroundColor = SuperMarketColor.blue_BDD1DE
    }
}
