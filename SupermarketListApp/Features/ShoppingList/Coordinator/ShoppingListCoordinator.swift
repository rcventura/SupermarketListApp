//
//  ShoppingListCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import UIKit

final class ShoppingListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var listTitle = String()
    var placeOfCreation = Bool()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ShoppingListViewController(listTitle: listTitle, listCreationPlace: self.placeOfCreation)
        let shoppingViewModel = ShoppingListViewModel()
        controller.hidesBottomBarWhenPushed = true
        controller.viewModel = shoppingViewModel
        shoppingViewModel.coordinator = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func openCategoriesController() {
        let coordinator = CategoriesCoordinator(navigationController: navigationController)
        coordinator.placeOfCreation = self.placeOfCreation
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
