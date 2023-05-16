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
}

extension ShoppingListViewController {
    private func actionComponentsView() {
        mainView.openCategotyList.addTarget(self, action: #selector(openCategoriesController), for: .touchUpInside)
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
            self.navigationController?.popViewController(animated: false)
        }
    }
}

extension ShoppingListViewController {
    private func delegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.listascriadas.count == 0 {
            mainView.addEmptyTitle()
            mainView.addEmptyMessage()
            mainView.addOpenCategotyList()
            
        }
        return viewModel.listascriadas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? UITableViewCell {
            cell.textLabel?.text = "oi"
        }
        return cell
    }
}

extension ShoppingListViewController {
    private func addLayout() {
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

