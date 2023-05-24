//
//  SMLabel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 19/05/23.
//

import UIKit

final class SMLabel: UIView {
    
    var titleLabel = UILabel()
    var titleValueLabel = UILabel()
    
    init(title: String?) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.titleLabel.font = UIFont(name: "Arial", size: 15)
        self.titleValueLabel.font = UIFont(name: "Arial", size: 15)
        addTitleLabel()
        addTitleValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
        ])
    }
    
    private func addTitleValueLabel() {
        addSubview(titleValueLabel)
        titleValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleValueLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            titleValueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            titleValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleValueLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        
        ])
    }
    
}
