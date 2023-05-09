//
//  ProfileCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 09/05/23.
//

import UIKit

final class ProfileCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProfileViewController()
//        let homeViewModel = HomeViewModel()
//        homeViewModel.coordinator = self
//        controller.viewModel = homeViewModel
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
}
    
