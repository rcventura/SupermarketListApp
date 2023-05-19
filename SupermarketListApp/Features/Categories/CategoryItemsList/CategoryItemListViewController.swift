//
//  CategoryListViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import UIKit

final class CategoryItemListViewController: UIViewController {
    
    let mainView: CategoryItemListView = .init()
    var viewModel = CategoryItemListViewModel()
    var categoryId: Int
    
    override func loadView() {
        view = mainView
    }
    
    init(categoryId: Int) {
        self.categoryId = categoryId
        super.init(nibName: nil, bundle: nil)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCategoryItems(categoryID: self.categoryId)
        viewModel.itemsByCategory()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.itemsByCategory()
    }
}

extension CategoryItemListViewController {
    private func delegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func actionButton() {
        mainView.saveButton.addTarget(self, action: #selector(addItems), for: .touchUpInside)
    }
    
    @objc private func backViewController() {
        viewModel.openCategory()
    }
    
    @objc private func addItems() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateLayout() {
        mainView.itemsquantity.text = Helper.shared.itemsAdded.count == 0 ? "0" : "\(Helper.shared.itemsAdded.count)"
        mainView.saveButton.isEnabled = !(Helper.shared.itemsAdded.count == 0)
    }
}

extension CategoryItemListViewController: CategoryItemListViewModelDelegate {
    func didSelectCategory() {
        viewModel.itemsCategory = viewModel.service.categoryItems
    }
}

extension CategoryItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? UITableViewCell {
            cell.textLabel?.text = viewModel.itemsCategory[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Helper.shared.itemsAdded.append(viewModel.itemsCategory[indexPath.row])
        updateLayout()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = Helper.shared.itemsAdded.firstIndex(of: viewModel.itemsCategory[indexPath.row]) {
            Helper.shared.itemsAdded.remove(at: index)
            updateLayout()
        }
    }
}

extension CategoryItemListViewController {
    private func addLayout() {
        updateLayout()
        delegates()
        actionButton()
        title = "Items"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backViewController))
    }
}
