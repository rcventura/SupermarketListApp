//
//  CategoryItemDetailView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 20/05/23.
//

import UIKit

final class CategoryItemDetailView: UIView {
    
    let headerView = UIView()
    let containerView = UIView()
    let itemSelectedTitleLabel = UILabel()
    let itemTitleLabel  = UILabel()
    let saveButton = SMButton(title: "Adicionar", enabledBackgroundColor: SMColor.gray_AFAFAF, disabledBackgroundColor: SMColor.gray_6F737E)
    let brandTextField = SMTextField(placeholder: "Marca")
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CategoryItemDetailView {
    
    private func addHeaderView() {
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.backgroundColor = SMColor.blue_BDD1DE
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addItemSelectedTitleLabel() {
        headerView.addSubview(itemSelectedTitleLabel)
        itemSelectedTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        itemSelectedTitleLabel.text = "Item selecionado"
        itemSelectedTitleLabel.font = UIFont(name: "Arial", size: 17)
        itemSelectedTitleLabel.textColor = SMColor.gray_AFAFAF
        
        
        NSLayoutConstraint.activate([
            itemSelectedTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            itemSelectedTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            itemSelectedTitleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20)
        ])
        
    }
    
    private func addItemTitle() {
        headerView.addSubview(itemTitleLabel)
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        itemTitleLabel.font = UIFont(name: "Arial", size: 14)
        itemTitleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            itemTitleLabel.topAnchor.constraint(equalTo: itemSelectedTitleLabel.bottomAnchor, constant: 5),
            itemTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            itemTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120)
        ])
    }
    
    private func addContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func addBrandItemTitle() {
        containerView.addSubview(brandTextField)
        
        brandTextField.translatesAutoresizingMaskIntoConstraints = false
        brandTextField.backgroundColor = SMColor.white_f3f6f5
        
        NSLayoutConstraint.activate([
            brandTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            brandTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            brandTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            brandTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addSaveButton() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            saveButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension CategoryItemDetailView {
    private func addLayout() {
        backgroundColor = SMColor.blue_BDD1DE
        addHeaderView()
        addItemSelectedTitleLabel()
        addItemTitle()
        addContainerView()
        addBrandItemTitle()
        addSaveButton()
    }
}
