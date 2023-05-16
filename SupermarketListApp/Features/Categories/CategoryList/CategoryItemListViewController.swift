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
    var itemsByCategory: [String] = []
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
}

extension CategoryItemListViewController: CategoryItemListViewModelDelegate {
    func didSelectCategory() {
        self.itemsByCategory = viewModel.service.categoryItems
    }
}

extension CategoryItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsByCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? UITableViewCell {
            cell.textLabel?.text = itemsByCategory[indexPath.row]
        }
        
        return cell
    }
}

extension CategoryItemListViewController {
    private func addLayout() {
        delegates()
        title = "AAA"
    }
}
