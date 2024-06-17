//
//  CategoryListView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 16/05/23.
//

import UIKit

final class CategoryItemListView: UIView {
    
    var tableView = UITableView()
    let stackView = UIStackView()
    let bodyStackView = UIStackView()
    let bottomStackView = UIStackView()
    let saveButton = SMButton(title: "Adicionar", enabledBackgroundColor: SMColor.gray_AFAFAF, disabledBackgroundColor: SMColor.gray_6F737E)
    let itemsquantity = SMLabel(title: "")
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryItemListView {
    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addBodyStackView() {
        stackView.addArrangedSubview(bodyStackView)
        bodyStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            bodyStackView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    
    private func addTableView() {
        bodyStackView.addArrangedSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryItemListCell")
        tableView.allowsMultipleSelection = true

        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: bodyStackView.widthAnchor),
        ])
    }
    
    private func addBottomStackView() {
        stackView.addArrangedSubview(bottomStackView)
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        
        bottomStackView.addArrangedSubview(itemsquantity)
        bottomStackView.addArrangedSubview(saveButton)
        
        bottomStackView.axis = .vertical
        bottomStackView.distribution = .equalCentering
        bottomStackView.spacing = 10
        bottomStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
    }
}

extension CategoryItemListView {
    private func addLayout() {
        addStackView()
        addBodyStackView()
        addTableView()
        addBottomStackView()
        backgroundColor = SMColor.blue_BDD1DE
    }
}
