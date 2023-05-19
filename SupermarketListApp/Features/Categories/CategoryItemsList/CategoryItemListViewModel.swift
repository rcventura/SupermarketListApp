//
//  CategoryListViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation


@objc protocol CategoryItemListViewModelDelegate: AnyObject {
    @objc optional func didSelectCategory()
    @objc optional func itemsSelecteds()
}

final class CategoryItemListViewModel {
    
    var coordinator: CategoriesCoordinator?
    weak var delegate: CategoryItemListViewModelDelegate?
    var service: ApiService
    var itemsCategory: [String] = []
    var itemsAdd: [String] = []
    
    init(service: ApiService = ApiService()) {
        self.service = service
    }
    
    func getCategoryItems(categoryID: Int) {
        service.getItemsCategory(categoryID: categoryID)
    }
    
    func itemsByCategory() {
        self.delegate?.didSelectCategory?()
    }
    
    func passArray() {
        self.delegate?.itemsSelecteds?()
    }
}

// Coordinations Calls
extension CategoryItemListViewModel {
    func openCategory() {
        coordinator?.openCategoriesController()
    }
}
