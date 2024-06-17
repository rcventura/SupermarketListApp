//
//  ShoppingListViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import Foundation

protocol ShoppingListViewModelDelegate: AnyObject {
    func didSuccess()
    func didError(message: String)
}

final class ShoppingListViewModel {
    weak var coordinator: ShoppingListCoordinator?
    weak var delegate: ShoppingListViewModelDelegate?
    let service: ApiService = .init()
}

extension ShoppingListViewModel {
    func saveList(nameList: String) {
        service.addNewList(nameList: nameList){ (result) in
            switch result {
            case .success(_):
                self.delegate?.didSuccess()
            case .failure(let error):
                self.delegate?.didError(message: error.localizedDescription)
            }
        }
    }
}

extension ShoppingListViewModel {
    func openCategoryList() {
        coordinator?.openCategoriesController()
    }
}
