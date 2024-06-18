//
//  AddUserViewModelDelegate.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

protocol AddUserViewModelDelegate: AnyObject {
    func didSuccess()
    func didError(message: String)
}

final class AddUserViewModel {
    
    weak var coordinator: AccountCoordinator?
    weak var delegate: AddUserViewModelDelegate?
    let service: ApiService = .init()
}

extension AddUserViewModel {
    func createNewUser(name: String, email: String, password: String) {
        service.addUser(requestItems: AddUserRequest.init(name: name, email: email, password: password)) { (result, error) in
            if result != nil {
                self.delegate?.didSuccess()
            } else if let error = error {
                self.delegate?.didError(message: error.localizedDescription)
            }
        }
    }
}
