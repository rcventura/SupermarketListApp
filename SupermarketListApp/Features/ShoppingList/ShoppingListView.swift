//
//  ShoppingListView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 10/04/23.
//

import UIKit

class ShoppingListView: UIView {

    let nameCategoryLabel = UILabel()
    let categoryTitle = UILabel()
    var tableView = UITableView()
    private let emptyView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    let openCategotyList = SuperMarketButton()
    let saveListButton = SuperMarketButton(title: "Salvar Lista", backgroundColor: SuperMarketColor.blue_4180AB)
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ShoppingListView {
    private func addNameCategoryLabel() {
        addSubview(nameCategoryLabel)
        
        nameCategoryLabel.text = "Nome da lista"
        nameCategoryLabel.font = UIFont(name: "Arial", size: 15)
        nameCategoryLabel.textColor = SuperMarketColor.gray_AFAFAF
        nameCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameCategoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nameCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameCategoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
    }
    private func addCategoryTitle() {
        addSubview(categoryTitle)
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        categoryTitle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: nameCategoryLabel.bottomAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func addEmptyTitle() {
        emptyView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        titleLabel.text = "Nenhum item na sua lista de compras"
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor)
        ])
    }
    
    func addEmptyMessage() {
        emptyView.addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.text = "Adicione seu primeiro item."
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    func addOpenCategotyList() {
        emptyView.addSubview(openCategotyList)
        openCategotyList.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        
        openCategotyList.setImage(UIImage(systemName: "plus.circle", withConfiguration: config), for: .normal)
        
        NSLayoutConstraint.activate([
            openCategotyList.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            openCategotyList.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor),

        ])
    }
    
    private func addTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundView = emptyView
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func addSaveList() {
        addSubview(saveListButton)
        saveListButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveListButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            saveListButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveListButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveListButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveListButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension ShoppingListView {
    private func addLayout() {
        addNameCategoryLabel()
        addCategoryTitle()
        addTableView()
        addSaveList()
        
        backgroundColor =  SuperMarketColor.blue_BDD1DE
    }
}
