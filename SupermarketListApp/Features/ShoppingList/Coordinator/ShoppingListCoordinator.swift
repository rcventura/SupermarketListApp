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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ShoppingListViewController(listTitle: listTitle)
        let shoppingViewModel = ShoppingListViewModel()
        controller.hidesBottomBarWhenPushed = true
        controller.viewModel = shoppingViewModel
        shoppingViewModel.coordinator = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func openCategoriesController() {
        let coordinator = CategoriesCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
