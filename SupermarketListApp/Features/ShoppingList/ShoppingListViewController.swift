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
    
    init(listTitle: String?) {
        mainView.categoryTitle.text = listTitle?.firstUppercased 
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
        updateLayout()
        mainView.tableView.reloadData()
    }
}

extension ShoppingListViewController {
    private func actionComponentsView() {
        mainView.openCategotyList.addTarget(self, action: #selector(openCategoriesController), for: .touchUpInside)
        mainView.newOthersItems.addTarget(self, action: #selector(openCategoriesController), for: .touchUpInside)
    }
    
    @objc private func openCategoriesController() {
        viewModel.openCategoryList()
    }
}

extension ShoppingListViewController {
    @objc func cancelList() {
        showSimpleAlert(title: "Atenção",
                        message: "Deseja realmente excluir sua lista?",
                        customTitle: "Cancelar",
                        cancelTitle: "Sim") { _ in
            Helper.shared.itemsAdded.removeAll()
            self.navigationController?.popViewController(animated: false)
        }
    }
}

extension ShoppingListViewController {
    private func delegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func updateLayout() {
        mainView.saveButton.isEnabled = !(Helper.shared.itemsAdded.count == 0)
        mainView.newOthersItems.isHidden = Helper.shared.itemsAdded.count == 0
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Helper.shared.itemsAdded.count == 0 {
            mainView.addEmptyTitle()
            mainView.addEmptyMessage()
            mainView.addOpenCategotyList()
        } else {
            mainView.tableView.backgroundView = .none
        }
        return Helper.shared.itemsAdded.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? UITableViewCell {
            cell.textLabel?.text = Helper.shared.itemsAdded[indexPath.row]
        }
        return cell
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

