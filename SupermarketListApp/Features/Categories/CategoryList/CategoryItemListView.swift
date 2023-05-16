//
//  CategoryListView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 16/05/23.
//

import UIKit

final class CategoryItemListView: UIView {
    
    var tableView = UITableView()
    
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
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CategoryItemListView {
    private func addLayout() {
        addTableView()
        backgroundColor = SuperMarketColor.blue_BDD1DE
    }
}
