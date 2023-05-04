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
        addLayout()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didErrorOccurred(message: String) {
        showSimpleAlert(title: "Atenção", message: message)
    }
}

extension LoginViewController {
    func addComponentsActions() {
        mainView.loginButton.addTarget(self, action: #selector(didSuccessLogin(button: )), for: .touchUpInside)
        mainView.googleSignInButton.addTarget(self, action: #selector(didSuccessLogin(button: )), for: .touchUpInside)
    }
}

extension LoginViewController {
    @objc func didSuccessLogin(button: UIButton) {
        guard let email = mainView.emailTextField.text,
              let password = mainView.passwordTextField.text
        else { return }
        
        switch button {
        case mainView.googleSignInButton:
            viewModel.authWithGoogle(controller: self)
        default:
            viewModel.authLogin(email: email, password: password)
        }
        
    }
}

extension LoginViewController {
    private func addLayout() {
        addComponentsActions()
    }
}
