//
//  AddShoppingListViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 24/06/24.
//

import UIKit

class AddShoppingListViewController: UIViewController {
    
    private var mainView: AddShoppingListView = .init()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.nameListTextField.delegate = self
        layout()
    }
}

extension AddShoppingListViewController {
    private func upgradeRadioButton() {
        if mainView.radioButton.isSelected {
            mainView.radioButton.setImage(SMImage.selectedIcon, for: .normal)
        } else {
            mainView.radioButton.setImage(SMImage.unSelectedIcon, for: .normal)
        }
    }
}
extension AddShoppingListViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        mainView.continueButtom.isEnabled = ((mainView.nameListTextField.text?.isEmpty) != false) ? false : true
    }
}

extension AddShoppingListViewController {
    private func layout() {
        upgradeRadioButton()
        title = "Lista de Compras"
        
    }
}
