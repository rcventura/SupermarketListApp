//
//  CategoryListViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import UIKit

final class CategoryItemListViewController: UIViewController {
    
    let mainView: CategoryItemListView = .init()
    var viewModel: CategoryItemListViewModel
    var categoryId: Int
    let placeOfCreation: Bool
    
    var itemsByID: ListItemCategory? {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    init( viewModel: CategoryItemListViewModel, categoryId: Int, placeOfCreation: Bool) {
        self.viewModel = viewModel
        self.categoryId = categoryId
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getCategoryItems(categoryID: self.categoryId)
//        viewModel.itemsByCategory()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        viewModel.itemsByCategory()
    }
}

extension CategoryItemListViewController {
    private func delegates() {
        viewModel.delegate = self
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
        viewModel.itemsAdd.forEach { item in
            Helper.shared.itemsAdded.append((ItemDataModel.init(itemTitle: item, itemDetal: [])))
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateLayout() {
        let arrayCount = viewModel.itemsAdd.count
        mainView.itemsquantity.titleLabel.text = arrayCount <= 1 ? "Item selecionado: " : "Items selecionados: "
        mainView.itemsquantity.titleValueLabel.text = arrayCount == 0 ? "0" : "\(arrayCount)"
        mainView.saveButton.isEnabled = !(arrayCount == 0)
        mainView.bottomStackView.isHidden = !(self.placeOfCreation)
    }
}

extension CategoryItemListViewController: CategoryItemListViewModelDelegate {
    func didFetchData() {
        guard let items = viewModel.categoryItemsList else { return }
        self.itemsByID = items
    }
    
    func didError(message: String) {
        showSimpleAlert(title: "Atenção", message: message)
    }
}

extension CategoryItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemsByID?.itemTitle.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryItemListCell", for: indexPath)
        
        if !self.placeOfCreation {
            cell.accessoryType = .disclosureIndicator
        }
        
        cell.textLabel?.text = self.itemsByID?.itemTitle[indexPath.row].itemTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        switch self.placeOfCreation {
        case true:
            cell?.accessoryType = .checkmark
            viewModel.itemsAdd.append(self.itemsByID?.itemTitle[indexPath.row].itemTitle ?? "")
            updateLayout()
        default:
            mainView.tableView.allowsMultipleSelection = false
            viewModel.openDetailItem(itemSelectedIndex: indexPath , itemSelectedName: self.itemsByID?.itemTitle[indexPath.row].itemTitle ?? "")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        switch self.placeOfCreation {
        case true:
//            if let index = viewModel.itemsAdd.firstIndex(of: viewModel.itemsCategory[indexPath.row]) {
//                viewModel.itemsAdd.remove(at: index)
//                updateLayout()
//            }
            cell?.accessoryType = .none
        default:
            break
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
