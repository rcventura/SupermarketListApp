//
//  CategoryItemDetailViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 19/05/23.
//

import UIKit

class CategoryItemDetailViewController: UIViewController {
    
    let mainView: CategoryItemDetailView = .init()
    
    init(itemSelectedIndex: IndexPath, itemSelectedName: String ) {
        super.init(nibName: nil, bundle: nil)
        mainView.itemTitleLabel.text = itemSelectedName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
    }
}

extension CategoryItemDetailViewController {
    
    private func actionComponentsView() {
        mainView.saveButton.addTarget(self, action: #selector(saveList), for: .touchUpInside)
    }
    
    private func delegates() {
        mainView.unitPickerView.delegate = self
        mainView.unitPickerView.dataSource = self
        mainView.unitTextField.delegate = self
    }
    
    @objc private func saveList() {
        guard let title = mainView.itemTitleLabel.text,
              let brand = mainView.brandTextField.text,
              let quantity = mainView.quantityTextField.text,
              let itemType = mainView.unitTextField.text,
              let itemPrice = mainView.princeTextField.text else { return }
        
        Helper.shared.itemsAdded.append((ItemsList.init(itemTitle: title,
                                                        itemDetal: ItemDetail.init(itemBrand: brand,
                                                                                    itemPrice: Double(itemPrice) ?? 0,
                                                                                    itemQuantitity: Double(quantity) ?? 0,
                                                                                    itemType: itemType))))
        self.navigationController?.popViewController(animated: true)
    }
}
extension CategoryItemDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        mainView.unitTextField.text = mainView.unitMeasure[0]
    }
}

extension CategoryItemDetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainView.unitMeasure.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        mainView.unitMeasure[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mainView.unitTextField.text = mainView.unitMeasure[row]
    }
}

extension CategoryItemDetailViewController {
    private func addLayout() {
        title = "Dados do item"
        actionComponentsView()
        delegates()
    }
}
