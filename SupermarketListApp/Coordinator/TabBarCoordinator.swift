//
//  TabBarCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/04/23.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []
    var controllers: [UINavigationController] = []
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    func start() {
        let pages: [TabBarNames] = [.home, .favorite, .profile]
        for tabbar in pages {
            let _ = getTabController(tabbar)
        }
        
        tabBarController.setViewControllers(self.controllers, animated: true)
        tabBarController.tabBar.isTranslucent = false
        tabBarController.selectedIndex = TabBarNames.home.rawValue
        tabBarController.tabBar.backgroundColor = SuperMarketColor.blue_E4EBF0
        tabBarController.tabBar.tintColor = SuperMarketColor.blue_4180AB
    }
      
    private func getTabController(_ page: TabBarNames) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem.init(title: page.setTabBarItemsTitle(),
                                                     image: page.setTabBarItemsImage(),
                                                     tag: page.pageOrderNumber())
        switch page {
        case .home:
            let coordinator = HomeCoordinator(navigationController: navController)
            childCoordinators.append(coordinator)
            controllers.append(coordinator.navigationController)
            coordinator.navigationController.tabBarItem = navController.tabBarItem
            coordinator.start()
        case .favorite:
            let coordinator = FavoriteCoordinator(navigationController: navController)
            childCoordinators.append(coordinator)
            controllers.append(coordinator.navigationController)
            coordinator.navigationController.tabBarItem = navController.tabBarItem
            coordinator.start()
        case .profile:
            let coordinator = ProfileCoordinator(navigationController: navController)
            childCoordinators.append(coordinator)
            controllers.append(coordinator.navigationController)
            coordinator.navigationController.tabBarItem = navController.tabBarItem
            coordinator.start()
        }
        return navController
    }
}
