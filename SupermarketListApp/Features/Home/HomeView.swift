//
//  HomeView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit


final class HomeView: UIView {
    
    lazy var tableView = UITableView()
    private let emptyView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    let createNewMarketListButton = SMButton()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {
    
    func addEmptyTitle() {
        emptyView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        titleLabel.text = "Você não tem nenhuma lista criada"
        
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
        messageLabel.text = "Crie sua primeira lista de compras."
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    func addNewListButton() {
        emptyView.addSubview(createNewMarketListButton)
        createNewMarketListButton.translatesAutoresizingMaskIntoConstraints = false
        
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        createNewMarketListButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: config), for: .normal)
        
        NSLayoutConstraint.activate([
            createNewMarketListButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            createNewMarketListButton.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor),

        ])
    }
        
    private func addTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeViewCell")
        tableView.backgroundView = emptyView
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView {
    private func addLayout() {
        backgroundColor =  SMColor.blue_BDD1DE
        addTableView()
    }
}
