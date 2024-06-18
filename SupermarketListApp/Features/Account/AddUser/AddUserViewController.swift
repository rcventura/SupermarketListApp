//
//  CreateNewUserViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import UIKit

final class AddUserViewController: UIViewController {
    
    private let mainView: AddUserView = .init()
    var viewModel = AddUserViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
        viewModel.delegate = self
    }
}

extension AddUserViewController {
    func addComponentsActions() {
        mainView.createButton.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
    }
    
    @objc func createNewUser() {
        guard let name = mainView.fullNameTextFiel.text,
              let email = mainView.emailTextField.text,
              let password = mainView.passwordTextField.text else { return }
        viewModel.createNewUser(name: name, email: email, password: password)
    }
}

extension AddUserViewController: AddUserViewModelDelegate {
    func didSuccess() {
        showSimpleAlert(title: "Sucesso", message: "Usuário criado com sucesso!", customHandler: { _,_ in
            self.dismiss(animated: true)
        })
    }
    
    func didError(message: String) {
        showSimpleAlert(title: "Atenção", message: message)
    }
}

extension AddUserViewController {
    private func addLayout() {
        addComponentsActions()
    }
}
