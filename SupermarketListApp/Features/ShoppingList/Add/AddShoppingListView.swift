//
//  AddShoppingListView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 24/06/24.
//

import UIKit

class AddShoppingListView: UIView {

    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let image = UIImageView()
    private let image2 = UIImageView()
    private let image3 = UIImageView()
    private let titleDescriptionLabel = UILabel()
    let nameListTextField = SMTextField(placeholder: "Nome da lista de compras")
    private let listCreationLocation = UILabel()
    var radioButton = SMButton()
    
    let continueButtom = SMButton(title: "Continuar", enabledBackgroundColor: SMColor.gray_295264, disabledBackgroundColor: SMColor.gray_6F737E)
    
    init() {
        super.init(frame: .zero)
        addLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddShoppingListView {
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = SMColor.white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func addContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .none

        containerView.setContentHuggingPriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    private func addImage() {
        containerView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = SMImage.addShoppingImage
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: containerView.topAnchor),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            image.widthAnchor.constraint(equalTo: containerView.widthAnchor),
        ])
    }
    
    private func addTitleDescriptionLabel() {
        containerView.addSubview(titleDescriptionLabel)
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleDescriptionLabel.font = UIFont(name: "Arial", size: 15)
        titleDescriptionLabel.numberOfLines = 0
        titleDescriptionLabel.text = "Vamos dar nome a sua lista de compras?"
        
        NSLayoutConstraint.activate([
            titleDescriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func addNameListTextField() {
        containerView.addSubview(nameListTextField)
        nameListTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameListTextField.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 10),
            nameListTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameListTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func addListCreationLocation() {
        containerView.addSubview(listCreationLocation)
        listCreationLocation.translatesAutoresizingMaskIntoConstraints = false
        
        listCreationLocation.font = UIFont(name: "Arial", size: 14)
        listCreationLocation.numberOfLines = 0
        listCreationLocation.text = "Agora informe o local de criação da lista"
        
        NSLayoutConstraint.activate([
            listCreationLocation.topAnchor.constraint(equalTo: nameListTextField.bottomAnchor, constant: 20),
            listCreationLocation.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            listCreationLocation.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func addContinueButtom() {
        addSubview(continueButtom)
        continueButtom.translatesAutoresizingMaskIntoConstraints = false
        
        continueButtom.isEnabled = false
        
        NSLayoutConstraint.activate([
            continueButtom.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            continueButtom.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            continueButtom.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
        ])
    }
    
}

extension AddShoppingListView {
    private func addLayout() {
        backgroundColor =  SMColor.blue_BDD1DE
        addScrollView()
        addContainerView()
        addImage()
        addTitleDescriptionLabel()
        addNameListTextField()
        addListCreationLocation()
        addContinueButtom()
    }
}

