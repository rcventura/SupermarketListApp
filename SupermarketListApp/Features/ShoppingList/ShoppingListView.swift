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
    let newOthersItems = SMButton(title: "Novo Item", enabledBackgroundColor: .clear)
    var tableView = UITableView()
    let emptyView = EmptyTableView(titleLabel: "Nenhum item na sua lista de compras", messageLabel: "Adicione seu primeiro item.", isHideNewButton: false)

    let saveButton = SMButton(title: "Salvar Lista", enabledBackgroundColor: SMColor.gray_295264, disabledBackgroundColor: SMColor.gray_6F737E)
    let stackView = UIStackView()
    let infotStackView = UIStackView()
    let buttomStackView = UIStackView()
    let quantityItemsLabel = SMLabel(title: "Total de items: ")
    let totalValueLabel = SMLabel(title: "Valor total: ")
    
    init() {
        super.init(frame: .zero)
        totalValueLabel.titleValueLabel.text = "R$ 0.00"
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
        nameCategoryLabel.textColor = SMColor.gray_295264
        
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
        ])
    }
    
    private func addNewOthersItems() {
        addSubview(newOthersItems)
        newOthersItems.translatesAutoresizingMaskIntoConstraints = false
        
        newOthersItems.titleLabel?.font = UIFont(name: "Arial", size: 14)
        newOthersItems.layer.borderColor = SMColor.gray_295264.withAlphaComponent(0.5).cgColor
        newOthersItems.setTitleColor(SMColor.gray_295264, for: .normal)
        newOthersItems.isHidden = true
        newOthersItems.layer.borderWidth = 1

        NSLayoutConstraint.activate([
            newOthersItems.topAnchor.constraint(equalTo: nameCategoryLabel.topAnchor),
            newOthersItems.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newOthersItems.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ShoopingListViewCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.spacing = 20
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func addInfoElementStackView() {
        stackView.addArrangedSubview(infotStackView)

        infotStackView.axis = .vertical
        infotStackView.spacing = 1

        infotStackView.addArrangedSubview(quantityItemsLabel)
        infotStackView.addArrangedSubview(totalValueLabel)
    }
    
    private func addSaveButtom() {
        stackView.addArrangedSubview(buttomStackView)
        buttomStackView.addArrangedSubview(saveButton)
    }
}

extension ShoppingListView {
    private func addLayout() {
        addNameCategoryLabel()
        addCategoryTitle()
        addNewOthersItems()
        addTableView()
        addStackView()
        addInfoElementStackView()
        addSaveButtom()
        backgroundColor =  SMColor.blue_BDD1DE
    }
}
