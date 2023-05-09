//
//  FavoriteCoordinator.swift
//  SupermarketListApp
//
//  Created by PremierSoft on 09/05/23.
//

import UIKit

final class FavoriteCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = FavoriteViewController()
//        let homeViewModel = HomeViewModel()
//        homeViewModel.coordinator = self
//        controller.viewModel = homeViewModel
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
}
    
