//
//  ShoppingListViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import Foundation

final class ShoppingListViewModel {
    weak var coordinator: ShoppingListCoordinator?
    var listascriadas: [String] = []
}

extension ShoppingListViewModel {
    func openCategoryList() {
        coordinator?.openCategoriesController()
    }
}
