//
//  CategoryListView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 16/05/23.
//

import UIKit

final class CategoryItemListView: UIView {
    
    var tableView = UITableView()
    let saveButton = SuperMarketButton(title: "Adicionar", enabledBackgroundColor: SuperMarketColor.gray_AFAFAF, disabledBackgroundColor: SuperMarketColor.gray_6F737E)
    let itemsAdded = UILabel()
    let itemsquantity = UILabel()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryItemListView {
    private func addTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsMultipleSelection = true
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func addItemsAdded() {
        addSubview(itemsAdded)
        
        itemsAdded.translatesAutoresizingMaskIntoConstraints = false
        itemsAdded.text = "Items adicionados: "
        
        NSLayoutConstraint.activate([
            itemsAdded.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            itemsAdded.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            itemsAdded.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    private func addItemsQuantity() {
        addSubview(itemsquantity)
        
        itemsquantity.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemsquantity.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            itemsquantity.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
    
    private func addSaveButton() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: itemsAdded.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension CategoryItemListView {
    private func addLayout() {
        addTableView()
        addItemsAdded()
        addItemsQuantity()
        addSaveButton()
        backgroundColor = SuperMarketColor.blue_BDD1DE
    }
}
