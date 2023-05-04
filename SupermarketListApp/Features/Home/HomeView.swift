//
//  HomeView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class HomeView: UIView {
    
    lazy var tableView = UITableView()
    private var listascriadas: [String] = []
    private let emptyView = UIView()
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    
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
    
    
    private func addTableView() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundView = emptyView
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listascriadas.count == 0 {
            addEmptyTitle()
            addEmptyMessage()
        }
        return listascriadas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? UITableViewCell {
            cell.textLabel?.text = "oi"
        }
        return cell
    }
}

extension HomeView {
    private func addLayout() {
        backgroundColor =  SuperMarketColor.blue_BDD1DE
        
        addTableView()
    }
}
