//
//  CategoriesViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import UIKit

protocol CategoriesViewModelDelegate: AnyObject {
    func didFetchData()
    func didError(message: String)
}

final class CategoriesViewModel {
    
    weak var delegate: CategoriesViewModelDelegate?
    weak var coordinator: CategoriesCoordinator?
    let service: ApiService = .init()
    var category: [CategoriesModel] = []
    
    func getCategory() {
        service.getCategories(completion: { (result) in
            switch result {
            case .success(let result):
                self.category = result
                self.delegate?.didFetchData()
            case .failure(let error):
                self.delegate?.didError(message: error.localizedDescription)
            }
        })
    }
    
    func openCategoryItemList(categoryId: Int, placeOfCreation: Bool) {
        self.coordinator?.categoriesCoordinator(categoryId: categoryId, placeOfCreation: placeOfCreation)
    }
}
