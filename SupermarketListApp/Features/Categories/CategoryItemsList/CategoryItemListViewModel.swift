//
//  CategoryListViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

protocol CategoryItemListViewModelDelegate: AnyObject {
    func didFetchData()
    func didError(message: String)
}

final class CategoryItemListViewModel {
    
    var coordinator: CategoriesCoordinator?
    weak var delegate: CategoryItemListViewModelDelegate?
    var service: ApiService
    var itemsAdd: [String] = []
    var categoryItemsList: ListItemCategory?
    init(service: ApiService = ApiService()) {
        self.service = service
    }
    
    func getCategoryItems(categoryID: Int) {
        service.getItemsCategory(categoryID: categoryID, completion: { (result) in
            switch result {
            case .success(let result):
                self.categoryItemsList = result
                self.delegate?.didFetchData()
            case .failure(let error):
                self.delegate?.didError(message: error.localizedDescription)
            }
        })
    }
}

// Coordinations Calls
extension CategoryItemListViewModel {
    func openCategory() {
        coordinator?.navigationController.popViewController(animated: false)
        coordinator?.start()
    }
    
    func openDetailItem(itemSelectedIndex: IndexPath, itemSelectedName: String) {
        coordinator?.openItemDetal(itemSelectedIndex: itemSelectedIndex, itemSelectedName: itemSelectedName)
    }
}
