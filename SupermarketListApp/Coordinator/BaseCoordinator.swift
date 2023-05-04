//
//  BaseCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var window: UIWindow
    let navigationController = UINavigationController()
    let tabBarController: UITabBarController
    
    init(window: UIWindow) {
        self.window = window
        self.window.backgroundColor = .black
        self.tabBarController = BaseTabBar.init()
    }
    
    func start() {
        let accountCoordinator = AccountCoordinator(navigationController: navigationController)
        self.childCoordinators.append(accountCoordinator)
        accountCoordinator.start()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}
