//
//  UIView+Extension.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 01/07/24.
//

import UIKit

extension UIView {
    
    @objc private func okButtonPressed(sender: UIBarButtonItem) {
        self.endEditing(true)
    }
    
    public func toolbarTextField() -> UIToolbar {
        let toolbar = UIToolbar(frame: .infinite)

        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let nextButtonItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(okButtonPressed))
        toolbar.items = [flexibleButton, nextButtonItem]
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = SMColor.blue_066699
        toolbar.sizeToFit()
        return toolbar
    }
}
