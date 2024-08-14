//
//  LoginViewController.swift.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let mainView: LoginView = .init()
    var viewModel = LoginViewModel()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.mainView.emailTextField.delegate = self
        addLayout()
    }
}

extension LoginViewController {
    func addComponentsActions() {
        mainView.loginButton.addTarget(self, action: #selector(didSuccessLogin(button: )), for: .touchUpInside)
        mainView.newUserButton.addTarget(self, action: #selector(didSuccessLogin(button: )), for: .touchUpInside)
    }
}

extension LoginViewController {
    @objc func didSuccessLogin(button: UIButton) {
        guard let email = mainView.emailTextField.text,
              let password = mainView.passwordTextField.text
        else { return }

        switch button {
        case mainView.newUserButton:
            viewModel.showCreateNewUser()
        default:
            viewModel.authLoginWithEmail(email: email, password: password)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}

extension LoginViewController {
    private func addLayout() {
        addComponentsActions()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didError(message: String) {
        showSimpleAlert(title: "Atenção", message: message)
    }
}
