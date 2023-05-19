//
//  LoginView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit
import GoogleSignIn
import GoogleSignInSwift

final class LoginView: UIView {
    
    let emailTextField = SuperMarketTextField(placeholder: "E-mail")
    let passwordTextField = SuperMarketTextField(placeholder: "Password")
    private let stackView =  UIStackView()
    let loginButton = SuperMarketButton(title: "Entrar", enabledBackgroundColor: SuperMarketColor.gray_AFAFAF)
    let newUserButton = SuperMarketButton(title: "Novo Usuário", enabledBackgroundColor: SuperMarketColor.gray_AFAFAF)
    private let loginWithSocialLabel = UILabel()
    let googleSignInButton = GIDSignInButton()
    
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
        
        emailTextField.backgroundColor = SuperMarketColor.white_f3f6f5
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
        passwordTextField.backgroundColor = SuperMarketColor.white_f3f6f5
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
    
    private func addLoginWithSocialLabel() {
        addSubview(loginWithSocialLabel)
        loginWithSocialLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginWithSocialLabel.text = "Ou: "
        loginWithSocialLabel.font = UIFont.systemFont(ofSize: 13)
        
        NSLayoutConstraint.activate([
            loginWithSocialLabel.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 40),
            loginWithSocialLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            loginWithSocialLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            loginWithSocialLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func addGoogleSignInButton() {
        addSubview(googleSignInButton)
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignInButton.layer.cornerRadius = 5
        googleSignInButton.backgroundColor = SuperMarketColor.white_f3f6f5
        
        NSLayoutConstraint.activate([
            googleSignInButton.topAnchor.constraint(equalTo: loginWithSocialLabel.bottomAnchor, constant: 10),
            googleSignInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            googleSignInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            googleSignInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension LoginView {
    private func setupLayout() {
        backgroundColor = SuperMarketColor.white
        addEmailTextField()
        addPasswordTextField()
        addStackView()
        addLoginButton()
        addNewUserButton()
        addLoginWithSocialLabel()
        addGoogleSignInButton()
    }
}
