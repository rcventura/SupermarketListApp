//
//  LoginView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class LoginView: UIView {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
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
    
    private func addScrollView() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
//        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .blue
        scrollView.contentSize = self.frame.size
//        scrollView.layer.borderWidth = 1
//        scrollView.layer.borderColor = SMColor.red_B3130F.cgColor
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func addContainerView() {
        scrollView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = SMColor.white

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    private func addEmailTextField() {
        containerView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.text = "rcvanalista@gmail.com"
        emailTextField.keyboardType = .emailAddress
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = SMColor.black.cgColor
        
        
        NSLayoutConstraint.activate([
            emailTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
    }
    
    private func addPasswordTextField() {
        containerView.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.setSecureField()
        passwordTextField.text = "123456"
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = SMColor.red_B3130F.cgColor
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
    }
    
    private func addForgotPasswordButton() {
        containerView.addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        forgotPasswordButton.setTitleColor(SMColor.blue_4180AB, for: .normal)
        forgotPasswordButton.layer.borderWidth = 1
        forgotPasswordButton.layer.borderColor = SMColor.red_B3130F.cgColor
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
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
        
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = SMColor.red_B3130F.cgColor
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}

extension LoginView {
    private func setupLayout() {
        
        addScrollView()
        addContainerView()
        addEmailTextField()
        addPasswordTextField()
        addForgotPasswordButton()
        addStackView()
        
    }
}
