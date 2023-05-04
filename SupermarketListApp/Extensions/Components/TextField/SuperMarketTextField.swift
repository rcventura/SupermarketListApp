//
//  SuperMarketTextField.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

class SuperMarketTextField: UITextField {
    let textFieldPadding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    
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
        self.layer.cornerRadius = 5
        self.autocapitalizationType = .none
    }
}

extension SuperMarketTextField {
    public func setSecureField() {
        self.rightView = secureEyeButton
        self.isSecureTextEntry = true
        self.rightViewMode = .always
        self.rightView?.tintColor = SuperMarketColor.gray_AFAFAF
        secureEyeButton.translatesAutoresizingMaskIntoConstraints = false
        secureEyeButton.setImage(SuperMarketImage.closedEyeIcon?.withRenderingMode(.alwaysTemplate) , for: .normal)
        secureEyeButton.addTarget(self, action: #selector(secureEyeButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            secureEyeButton.widthAnchor.constraint(equalToConstant: 45)
            ])
    }
    
    @objc private func secureEyeButtonPressed() {
        if self.isSecureTextEntry {
            self.isSecureTextEntry = false
            secureEyeButton.setImage(SuperMarketImage.openEyeIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        } else {
            self.isSecureTextEntry = true
            secureEyeButton.setImage(SuperMarketImage.closedEyeIcon?.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
}

extension SuperMarketTextField {
    private func addLayout() {
        self.backgroundColor = SuperMarketColor.white
        addTextField()
    }
    
    func setup(field: UIView) {
        self.backgroundColor = SuperMarketColor.white
    }
}

extension SuperMarketTextField: UITextFieldDelegate {
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
