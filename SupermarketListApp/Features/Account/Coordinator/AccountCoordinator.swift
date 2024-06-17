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
    var rootViewController: UIViewController?
    let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginViewController()
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinator = self
        controller.viewModel = loginViewModel
        self.navigationController.pushViewController(controller, animated: false)
    }
    
    func showHomeViewController() {
        rootViewController = UITabBarController()
        window.rootViewController = rootViewController
        
        let tabCoordinator = TabBarCoordinator(tabBarController: rootViewController as! UITabBarController)
        childCoordinators.append(tabCoordinator)
        tabCoordinator.start()
    }
    
    func showCreateNewUser() {
        let controller = CreateNewUserViewController()
        let createNewUserViewModel = CreateNewUserViewModel()
        createNewUserViewModel.coordinator = self
        controller.viewModel = createNewUserViewModel
        self.navigationController.pushViewController(controller, animated: true)
    }
}
