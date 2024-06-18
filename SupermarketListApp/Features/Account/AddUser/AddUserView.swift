//
//  AddUserView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import UIKit

final class AddUserView: UIView {
    let fullNameTextFiel = SMTextField(placeholder: "Nome completo")
    let emailTextField = SMTextField(placeholder: "E-mail")
    let passwordTextField = SMTextField(placeholder: "Password")
    let createButton = SMButton(title: "Cadastrar", enabledBackgroundColor: SMColor.gray_295264)
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddUserView {
    
    private func addFullName() {
        addSubview(fullNameTextFiel)
        fullNameTextFiel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fullNameTextFiel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            fullNameTextFiel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            fullNameTextFiel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    private func addEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: fullNameTextFiel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: fullNameTextFiel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: fullNameTextFiel.trailingAnchor),
        ])
    }
    
    private func addPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.setSecureField()
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: fullNameTextFiel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: fullNameTextFiel.trailingAnchor),
        ])
    }
    
    private func addCreateButton() {
        addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            createButton.leadingAnchor.constraint(equalTo: fullNameTextFiel.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: fullNameTextFiel.trailingAnchor),
        ])
    }
}

extension AddUserView {
    private func setupLayout() {
        backgroundColor = SMColor.white
        addFullName()
        addEmailTextField()
        addPasswordTextField()
        addCreateButton()
    }
}
