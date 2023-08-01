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
    let loginButton = SMButton(title: "Entrar", enabledBackgroundColor: SMColor.gray_AFAFAF)
    let newUserButton = SMButton(title: "Novo Usuário", enabledBackgroundColor: SMColor.gray_AFAFAF)
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
        
        emailTextField.backgroundColor = SMColor.white_f3f6f5
        emailTextField.text = "rcvanalista@gmail.com"
        
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    private func addPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.setSecureField()
        passwordTextField.backgroundColor = SMColor.white_f3f6f5
        passwordTextField.text = "123456"
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor)
        ])
    }
    
    private func addLoginButton() {
        stackView.addArrangedSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addNewUserButton() {
        stackView.addArrangedSubview(newUserButton)
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newUserButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addForgotPasswordButton() {
        addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.setTitleColor(.black, for: .normal)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension LoginView {
    private func setupLayout() {
        backgroundColor = SMColor.white
        addEmailTextField()
        addPasswordTextField()
        addStackView()
        addLoginButton()
        addNewUserButton()
        addForgotPasswordButton()
    }
}
