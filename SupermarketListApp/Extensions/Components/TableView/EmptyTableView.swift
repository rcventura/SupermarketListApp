//
//  EmptyTableView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 18/07/23.
//

import UIKit

final class EmptyTableView: UIView {
    
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    let newButton = SMButton()
    
    init(titleLabel: String?, messageLabel: String?, isHideNewButton: Bool = true) {
        self.titleLabel.text = titleLabel
        self.messageLabel.text = messageLabel
        self.newButton.isHidden = isHideNewButton
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addEmptyTitle() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
          
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func addEmptyMessage() {
        addSubview(messageLabel)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
         
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor)
        ])
    }
    
    func addNewListButton() {
        addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false

        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        newButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: config), for: .normal)

        NSLayoutConstraint.activate([
            newButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            newButton.centerXAnchor.constraint(equalTo: messageLabel.centerXAnchor),

        ])
    }
}

extension EmptyTableView {
    private func addLayout() {
        backgroundColor =  SMColor.white
        addEmptyTitle()
        addEmptyMessage()
        addNewListButton()
    }
}
