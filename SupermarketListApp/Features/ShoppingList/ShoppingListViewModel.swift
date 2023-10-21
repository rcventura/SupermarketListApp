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
    func saveList(listData: SaveListRequest) {
        Helper.shared.itemsAdded.forEach({ name in
            itemName = name.itemTitle
            
            name.itemDetal?.forEach { detail in
                itemBrand = detail.itemBrand ?? ""
                itemPrice = detail.itemPrice ?? 0
                itemQuantitity = detail.itemQuantitity ?? 0
                itemType = detail.itemType ?? ""
            }
        })
//Cannot convert value of type 'SaveListRequest' to expected argument type '[SaveListRequest]'
        print("ITEMNAME DA VIEWMODEL 3: \(Helper.shared.itemsAdded)")
        
        service.saveList(listData: [SaveListRequest(userID: listData.userID,
                                                   nameList: listData.nameList,
                                                   itemsList: [ItemsList(itemTitle: itemName,
                                                                         itemDetal: [ItemDetail(itemBrand: self.itemBrand,
                                                                                               itemPrice: self.itemPrice,
                                                                                               itemQuantitity: self.itemQuantitity,
                                                                                               itemType: self.itemType)])])]) { (result, error) in
            
            if result != nil {
                print("xxxxxxxx: \(self.itemName)")
                self.delegate?.didSuccess()
            } else if let error = error {
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
