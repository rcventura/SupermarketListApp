//
//  CategoriesViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation


final class CategoriesViewModel {
    
    weak var coordinator: CategoriesCoordinator?
    let service: ApiService
    var category: [Category] = []
    
    init(service: ApiService = ApiService()) {
        self.service = service
        service.getCategories()
    }
    
    func getCategory() {
        self.category = self.service.category
    }
    
    func openCategoryItemList(categoryId: Int, placeOfCreation: Bool) {
        self.coordinator?.CategoriesCoordinator(categoryId: categoryId, placeOfCreation: placeOfCreation)
    }
}
