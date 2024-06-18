//
//  SuperMarketTextField.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

class SMTextField: UITextField {
    let textFieldPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    private let secureEyeButton = UIButton()
    
    init(placeholder: String = "") {
        super.init(frame: .zero)
        setup(field: self)
        addLayout()
        self.delegate = self
        self.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTextField() {
        self.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.layer.cornerRadius = 8
        self.autocapitalizationType = .none
        self.layer.borderColor = SMColor.blue_BDD1DE.cgColor
        self.layer.borderWidth = 1
        self.keyboardType = .asciiCapable
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

extension SMTextField {
    public func setSecureField() {
        secureEyeButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        self.rightView = secureEyeButton
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView?.tintColor = SMColor.gray_295264
        secureEyeButton.translatesAutoresizingMaskIntoConstraints = false
        secureEyeButton.setImage(SMImage.closedEyeIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        secureEyeButton.addTarget(self, action: #selector(secureEyeButtonPressed), for: .touchUpInside)
    }
    
    @objc private func secureEyeButtonPressed() {
        if self.isSecureTextEntry {
            self.isSecureTextEntry = false
            secureEyeButton.setImage(SMImage.openEyeIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            self.isSecureTextEntry = true
            secureEyeButton.setImage(SMImage.closedEyeIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    @objc private func okButtonPressed(sender: UIBarButtonItem) {
        self.endEditing(true)
    }
    
    public func toolbarTextField() -> UIView {
        let toolbar = UIToolbar()
        let flexibleButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let nextButtonItem = UIBarButtonItem(title: "OK",
                                             style: .plain,
                                             target: nil,
                                             action: #selector(okButtonPressed))
        toolbar.items = [flexibleButton, nextButtonItem]
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = SMColor.blue_066699
        toolbar.sizeToFit()
        return toolbar
    }
}

extension SMTextField {
    private func addLayout() {
        self.backgroundColor = SMColor.blue_EDF3FA
        addTextField()
    }
    
    func setup(field: UIView) {
        self.backgroundColor = SMColor.white
    }
}

extension SMTextField: UITextFieldDelegate {
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textFieldPadding)
    }
}
