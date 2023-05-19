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
    let newOthersItems = SuperMarketButton(title: "Novo Item", enabledBackgroundColor: .clear)
    var tableView = UITableView()
    private let emptyView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    let categoryListButton = SuperMarketButton()
    let saveButton = SuperMarketButton(title: "Salvar Lista", enabledBackgroundColor: SuperMarketColor.gray_AFAFAF, disabledBackgroundColor: SuperMarketColor.gray_6F737E)
    
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
        nameCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameCategoryLabel.text = "Nome da lista"
        nameCategoryLabel.font = UIFont(name: "Arial", size: 17)
        nameCategoryLabel.textColor = SuperMarketColor.gray_AFAFAF
        
        
        NSLayoutConstraint.activate([
            nameCategoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nameCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameCategoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
    }
    private func addCategoryTitle() {
        addSubview(categoryTitle)
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        categoryTitle.font = UIFont(name: "Arial", size: 14)
        categoryTitle.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: nameCategoryLabel.bottomAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120)
        ])
    }
    
    private func addNewOthersItems() {
        addSubview(newOthersItems)
        newOthersItems.translatesAutoresizingMaskIntoConstraints = false
        
        newOthersItems.titleLabel?.font = UIFont(name: "Arial", size: 14)
        newOthersItems.layer.borderColor = SuperMarketColor.gray_AFAFAF.withAlphaComponent(0.5).cgColor
        newOthersItems.setTitleColor(SuperMarketColor.gray_AFAFAF, for: .normal)
        newOthersItems.isHidden = true
        newOthersItems.layer.borderWidth = 1

        NSLayoutConstraint.activate([
            newOthersItems.topAnchor.constraint(equalTo: nameCategoryLabel.topAnchor),
            newOthersItems.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newOthersItems.heightAnchor.constraint(equalToConstant: 30),
            newOthersItems.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func addEmptyTitle() {
        emptyView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        titleLabel.text = "Nenhum item na sua lista de compras"
        titleLabel.textColor = UIColor.black
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor)
        ])
    }
    
    func addEmptyMessage() {
        emptyView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        messageLabel.text = "Adicione seu primeiro item."
        messageLabel.textColor = UIColor.lightGray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    func addCategoryListButton() {
        emptyView.addSubview(categoryListButton)
        categoryListButton.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        categoryListButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: config), for: .normal)
        
        NSLayoutConstraint.activate([
            categoryListButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            categoryListButton.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor),

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
    
    private func addSaveButton() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension ShoppingListView {
    private func addLayout() {
        addNameCategoryLabel()
        addCategoryTitle()
        addNewOthersItems()
        addTableView()
        addSaveButton()
        backgroundColor =  SuperMarketColor.blue_BDD1DE
    }
}
