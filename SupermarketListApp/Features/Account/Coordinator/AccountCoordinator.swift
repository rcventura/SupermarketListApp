//
//  AccountCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class AccountCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginViewController()
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinator = self
        controller.viewModel = loginViewModel
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
    func openHomeViewController() {
        let startTabBar = TabBarCoordinator(navigationController: navigationController)
        childCoordinators.append(startTabBar)
        startTabBar.start()
    }
}
