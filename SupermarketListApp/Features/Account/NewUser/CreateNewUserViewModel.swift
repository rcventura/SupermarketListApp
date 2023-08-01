//
//  CreateNewUserViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

protocol CreatenewUserViewModelDelegate: AnyObject {
    func didSuccess()
    func didError(message: String)
}

final class CreateNewUserViewModel {
    
    weak var coordinator: AccountCoordinator?
    weak var delegate: CreatenewUserViewModelDelegate?
    let service: ApiService
    
    init(service: ApiService = ApiService()) {
        self.service = service
    }
}

extension CreateNewUserViewModel {
    func createNewUser(name: String, email: String, password: String) {
        service.createNewUser(requestItems: CreateNewUserRequest.init(name: name, email: email, password: password))  { (result, error) in
            if result != nil {
                self.delegate?.didSuccess()
            } else if let error = error {
                self.delegate?.didError(message: error.localizedDescription)
            }
        }
    }
}
