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
    
    var itemName = (String)()
    var itemBrand = String()
    var itemPrice = Double()
    var itemQuantitity = Double()
    var itemType = String()
    
}

extension ShoppingListViewModel {
    func saveList(userID: Int, nameList: String) {
        service.addNewList(userID: userID,
                         nameList: nameList){ (result) in
            switch result {
            case .success(let result):
                print("xxxxxxxx: \(result)")
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
