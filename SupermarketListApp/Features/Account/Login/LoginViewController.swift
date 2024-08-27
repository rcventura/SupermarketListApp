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
        self.mainView.passwordTextField.delegate = self
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.mainView.emailTextField:
            self.mainView.passwordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
    }
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
