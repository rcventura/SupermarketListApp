//
//  ShoppingListViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 10/04/23.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    let mainView: ShoppingListView = .init()
    var viewModel = ShoppingListViewModel()
    let listCreationPlace: Bool
    
    init(listTitle: String?, listCreationPlace: Bool) {
        mainView.categoryTitle.text = listTitle?.firstUppercased
        self.listCreationPlace = listCreationPlace
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
        updateLayout()
        mainView.tableView.reloadData()
    }
}

extension ShoppingListViewController {
    private func actionComponentsView() {
        mainView.emptyView.newButton.addTarget(self, action: #selector(openCategoriesController), for: .touchUpInside)
        mainView.newOthersItems.addTarget(self, action: #selector(openCategoriesController), for: .touchUpInside)
        mainView.saveButton.addTarget(self, action: #selector(saveList), for: .touchUpInside)
    }
    
    @objc private func openCategoriesController() {
        viewModel.openCategoryList()
    }
    
    @objc private func saveList() {
        guard let title = mainView.categoryTitle.text else { return }
        let listItems = Helper.shared.itemsAdded
        
        Helper.shared.listCreated.append((nomeList: title, itemsList: listItems))
        print("AAAAAAAAAA \(Helper.shared.listCreated)")
        Helper.shared.itemsAdded.removeAll()
        self.navigationController?.popViewController(animated: true)
    }
    
    private func delegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func updateLayout() {
        mainView.saveButton.isEnabled = !(Helper.shared.itemsAdded.count == 0)
        mainView.newOthersItems.isHidden = Helper.shared.itemsAdded.count == 0
        mainView.infoElementsStackView.isHidden = Helper.shared.itemsAdded.count == 0
        mainView.listItemsCount.titleValueLabel.text = "\(Helper.shared.itemsAdded.count)"
        mainView.listTotalValue.isHidden = self.listCreationPlace
    }
}

extension ShoppingListViewController {
    @objc func cancelList() {
        showSimpleAlert(title: "Atenção",
                        message: "Deseja realmente excluir sua lista?",
                        customTitle: "Cancelar",
                        cancelTitle: "Sim") { _,_ in
            Helper.shared.itemsAdded.removeAll()
            self.navigationController?.popViewController(animated: false)
        }
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Helper.shared.itemsAdded.count == 0 {
            self.mainView.tableView.backgroundView = self.mainView.emptyView
            self.mainView.tableView.isScrollEnabled = false
        } else {
            mainView.tableView.backgroundView = .none
        }
        return Helper.shared.itemsAdded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoopingListViewCell", for: indexPath)
        let itemTitle = Helper.shared.itemsAdded[indexPath.row].itemTitle
        
        cell.textLabel?.text = itemTitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        viewModel.openDetailItem()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

extension ShoppingListViewController {
    private func addLayout() {
        updateLayout()
        actionComponentsView()
        delegates()
        title = "Lista de Compras"
        navigationItem.hidesBackButton = true
        let iconImage = UIImage(systemName: "trash")?.withRenderingMode(.alwaysTemplate)
        let trashIcon = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(cancelList))
        navigationItem.rightBarButtonItem = trashIcon
        navigationController?.navigationBar.tintColor = .red.withAlphaComponent(0.5)
    }
}

