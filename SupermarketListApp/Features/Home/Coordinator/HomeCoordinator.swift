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
    
    func start() {
        let controller = HomeViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.coordinator = self
        controller.viewModel = homeViewModel
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func newSuperMarketList(listTitle: String, placeOfCreation: Bool) {
        let shoppingCoordinator = ShoppingListCoordinator(navigationController: navigationController)
        shoppingCoordinator.listTitle = listTitle
        shoppingCoordinator.placeOfCreation = placeOfCreation
        childCoordinators.append(shoppingCoordinator)
        shoppingCoordinator.start()
    }
}
