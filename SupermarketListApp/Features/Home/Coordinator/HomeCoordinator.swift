//
//  HomeCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func newSuperMarketList(listTitle: String) {
        let shoppingCoordinator = ShoppingListCoordinator(navigationController: navigationController)
        let controller = ShoppingListViewController(listTitle: listTitle)
        let shoppingViewModel = ShoppingListViewModel()
        shoppingViewModel.coordinator = shoppingCoordinator
        controller.viewModel = shoppingViewModel
        childCoordinators.append(shoppingCoordinator)
        self.navigationController.pushViewController(controller, animated: true)
    }
}
