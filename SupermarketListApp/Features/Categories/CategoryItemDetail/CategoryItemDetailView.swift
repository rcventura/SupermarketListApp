//
//  CategoryItemDetailView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 20/05/23.
//

import UIKit

final class CategoryItemDetailView: UIView {
    
    let unitMeasure = ["Caixa", "Gramas", "Litros" , "Unidade", "Kilos"]
    
    let headerView = UIView()
    let containerView = UIView()
    let itemSelectedTitleLabel = UILabel()
    let itemTitleLabel  = UILabel()
    
    let stackView = UIStackView()
    let brandTextField = SMTextField(placeholder: "Marca")
    
    let priceStackView = UIStackView()
    let quantityTextField = SMTextField(placeholder: "Quantidade")
    let unitTextField = SMTextField(placeholder: "Unidade")
    var unitPickerView = UIPickerView()
    let princeTextField = SMTextField(placeholder: "Preço")
    let totalValueTextField = UILabel()
    
    let saveButton = SMButton(title: "Adicionar", enabledBackgroundColor: SMColor.gray_AFAFAF, disabledBackgroundColor: SMColor.gray_6F737E)
    
    private var pickerToolbar = UIToolbar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func okButtonPressed(sender: UIBarButtonItem) {
        unitTextField.endEditing(true)
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
    
    private func addStackView() {
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    private func addBrandItemTitleTextField() {
        stackView.addArrangedSubview(brandTextField)
        brandTextField.translatesAutoresizingMaskIntoConstraints = false
        
        brandTextField.backgroundColor = SMColor.white_f3f6f5
        
        NSLayoutConstraint.activate([
            brandTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addPriceStackView() {
        stackView.addArrangedSubview(priceStackView)
        
        priceStackView.axis = .horizontal
        priceStackView.distribution = .fillEqually
        priceStackView.spacing = 10
    }
    
    private func addQuantityTextField() {
        priceStackView.addArrangedSubview(quantityTextField)
        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        
        quantityTextField.backgroundColor = SMColor.white_f3f6f5
        quantityTextField.keyboardType = .decimalPad
        
        NSLayoutConstraint.activate([
            quantityTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func addUnitTextField() {
        priceStackView.addArrangedSubview(unitTextField)
        unitTextField.translatesAutoresizingMaskIntoConstraints = false
        
        unitTextField.backgroundColor = SMColor.white_f3f6f5
        unitTextField.inputView = unitPickerView
        
        
        let toolbar = UIToolbar()
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let nextButtonItem = UIBarButtonItem(title: "OK",
                                             style: .plain,
                                             target: nil,
                                             action: #selector(okButtonPressed))
        toolbar.items = [flexibleButton, nextButtonItem]
        toolbar.barStyle = .default
        toolbar.isTranslucent = false
        toolbar.sizeToFit()

        unitTextField.inputAccessoryView = toolbar
    }
    
    private func addPriceTextField() {
        priceStackView.addArrangedSubview(princeTextField)
        
        princeTextField.backgroundColor = SMColor.white_f3f6f5
        princeTextField.keyboardType = .decimalPad

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
        addStackView()
        addBrandItemTitleTextField()
        addPriceStackView()
        addQuantityTextField()
        addUnitTextField()
        addPriceTextField()
        addSaveButton()
    }
}
