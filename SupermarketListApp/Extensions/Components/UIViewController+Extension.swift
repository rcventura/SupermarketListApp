//
//  UIViewController+Extension.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

extension UIViewController {
    func showSimpleAlert(title: String,
                         message: String?,
                         customTitle: String = "OK",
                         customHandler: ((UIAlertAction) -> Void)? = nil,
                         cancelTitle: String? = nil,
                         cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBt = UIAlertAction(title: customTitle, style: .default) { (alertAction) in
            alert.dismiss(animated: true, completion: nil)
            customHandler?(alertAction)
        }
        alert.addAction(okBt)
        if let cancelTitle = cancelTitle {
            let cancelBt = UIAlertAction(title: cancelTitle, style: .destructive) { (alertAction) in
                alert.dismiss(animated: true, completion: nil)
                cancelHandler?(alertAction)
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
            textField.translatesAutoresizingMaskIntoConstraints = false
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
