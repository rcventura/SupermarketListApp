//
//  LoginView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class LoginView: UIView {
    
    let emailTextField = SMTextField(placeholder: "E-mail")
    let passwordTextField = SMTextField(placeholder: "Password")
    private let stackView =  UIStackView()
    let loginButton = SMButton(title: "Entrar", enabledBackgroundColor: SMColor.gray_295264)
    let newUserButton = SMButton(title: "Novo Usuário", enabledBackgroundColor: SMColor.gray_295264)
    let forgotPasswordButton = SMButton(title: "Esqueci a senha")
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func addEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.text = "rcvanalista@gmail.com"
        emailTextField.inputAccessoryView = emailTextField.toolbarTextField()
        
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
        
    }
    
    private func addPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.setSecureField()
        passwordTextField.text = "123456"
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
        ])
    }
    
    private func addForgotPasswordButton() {
        addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.setTitleColor(.black, for: .normal)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(newUserButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ])
    }
}

extension LoginView {
    private func setupLayout() {
        backgroundColor = SMColor.white
        addEmailTextField()
        addPasswordTextField()
        addForgotPasswordButton()
        addStackView()
        
    }
}
