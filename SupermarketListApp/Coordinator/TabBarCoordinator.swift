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
    var navigationController: [UINavigationController] = []
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    func start() {
        let pages: [TabBarItems] = [.home, .favorite, .profile]
        self.navigationController = pages.map({ getTabController($0) })
        configTabBarController()
    }
    
    private func configTabBarController() {
        tabBarController.setViewControllers(self.navigationController, animated: true)
        tabBarController.selectedIndex = TabBarItems.home.rawValue
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = SMColor.blue_E4EBF0
        tabBarController.tabBar.tintColor = SMColor.blue_4180AB
    }
      
    private func getTabController(_ page: TabBarItems) -> UINavigationController  {
        let navController = UINavigationController()
        let coordinator: Coordinator
        navController.tabBarItem = UITabBarItem.init(title: page.setTabBarItemsTitle(),
                                                     image: page.setTabBarItemsImage(),
                                                     tag: page.pageOrderNumber())
        switch page {
        case .home:
            coordinator = HomeCoordinator(navigationController: navController)
        case .favorite:
            coordinator = FavoriteCoordinator(navigationController: navController)
        case .profile:
            coordinator = ProfileCoordinator(navigationController: navController)
        }
        childCoordinators.append(coordinator)
        coordinator.start()
        return navController
    }
}
