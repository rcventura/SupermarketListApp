//
//  LoginViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

protocol LoginViewModelDelegate: AnyObject {
    func didErrorOccurred(message: String)
}

final class LoginViewModel {
    weak var coordinator: AccountCoordinator?
    weak var delegate: LoginViewModelDelegate?
    var auth = Auth.auth()
}

extension LoginViewModel {
    
    func authLogin(email: String, password: String) {
        self.auth.signIn(withEmail: email, password: password, completion: { [weak self] (result, error) in
            if error != nil {
                self?.delegate?.didErrorOccurred(message: "Usuário ou senha inválidos.")
            } else if result == nil {
                self?.delegate?.didErrorOccurred(message: "Usuário ou senha inválidos.")
            } else {
                self?.openHomeViewController()
            }
        })
    }
    
    func authWithGoogle(controller: UIViewController) {
        guard let clientID = self.auth.app?.options.clientID else { fatalError("Nenhum client ID encontrado") }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { [unowned self] result, error in
            if error != nil {
                self.delegate?.didErrorOccurred(message: error?.localizedDescription ?? "")
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString  else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { [weak self] result, error in
                if error != nil {
                    self?.delegate?.didErrorOccurred(message: "Erro interno no servidor.")
                } else if result == nil {
                    self?.delegate?.didErrorOccurred(message: "Erro interno no servidor.")
                } else {
                    self?.openHomeViewController()
                }
            }
        }
    }
}

extension LoginViewModel {
    func openHomeViewController() {
        self.coordinator?.openHomeViewController()
    }
}
