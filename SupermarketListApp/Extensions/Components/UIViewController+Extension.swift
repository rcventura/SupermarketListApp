//
//  UIViewController+Extension.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

extension UIViewController {
    func showSimpleAlert(title: String,
                         message: String?,
                         customTitle: String = "OK",
                         customHandler: ((UIAlertAction, _ placeOfCreation: Bool ) -> Void)? = nil,
                         cancelTitle: String? = nil,
                         cancelHandler: ((UIAlertAction, _ placeOfCreation: Bool ) -> Void)? = nil,
                         cancelTitleStyle: (UIAlertAction.Style) = .destructive) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBt = UIAlertAction(title: customTitle, style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
            customHandler?(alertAction, true)
        }
        alert.addAction(okBt)
        if let cancelTitle = cancelTitle {
            let cancelBt = UIAlertAction(title: cancelTitle, style: cancelTitleStyle) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
                cancelHandler?(alertAction, false)
            }
            alert.addAction(cancelBt)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTextField(title: String,
                                message: String,
                                customTitle: String? = nil,
                                cancelTitle: String? = nil,
                                textFieldPlaceholder: String? = nil,
                                inputKeyboardType: UIKeyboardType = UIKeyboardType.default,  
                                cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                                actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = textFieldPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: cancelTitle, style: .destructive, handler: cancelHandler))
        alert.addAction(UIAlertAction(title: customTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
