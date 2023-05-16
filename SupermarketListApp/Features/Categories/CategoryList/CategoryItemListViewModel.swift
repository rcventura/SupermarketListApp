//
//  CategoryListViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

protocol CategoryItemListViewModelDelegate: AnyObject {
    func didSelectCategory()
}

final class CategoryItemListViewModel {
    
    weak var coordinator: CategoriesCoordinator?
    weak var delegate: CategoryItemListViewModelDelegate?
    var service: ApiService
    
    init(service: ApiService = ApiService()) {
        self.service = service
    }
    
    func getCategoryItems(categoryID: Int) {
        service.getItemsCategory(categoryID: categoryID)
    }
    
    func itemsByCategory() {
        self.delegate?.didSelectCategory()
    }
}
