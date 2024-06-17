//
//  LoginViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func didError(message: String)
}

final class LoginViewModel {
    weak var coordinator: AccountCoordinator?
    weak var delegate: LoginViewModelDelegate?
    let service: ApiService = .init()
}

extension LoginViewModel {
    
    func authLoginWithEmail(email: String, password: String) {
        service.loginUser(requestItems: AuthLoginRequest(email: email, password: password), completion: { (result) in
            switch result {
            case .success(_):
                self.showHomeViewController()
            case .failure(let error):
                self.delegate?.didError(message: error.localizedDescription)
            }
        })
    }
}

extension LoginViewModel {
    func showHomeViewController() {
        self.coordinator?.showHomeViewController()
    }
    
    func showCreateNewUser() {
        self.coordinator?.showCreateNewUser()
    }
}
