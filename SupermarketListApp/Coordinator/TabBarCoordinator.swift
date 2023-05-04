//
//  TabBarCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/04/23.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController = UITabBarController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let pages: [TabBarNames] = [.home, .favorite, .account]
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarNames.home.rawValue
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = SuperMarketColor.blue_E4EBF0
        tabBarController.tabBar.tintColor = SuperMarketColor.blue_4180AB
        navigationController.viewControllers = [tabBarController]
    }
      
    private func getTabController(_ page: TabBarNames) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem = UITabBarItem.init(title: page.setTabBarItemsTitle(),
                                                     image: page.setTabBarItemsImage(),
                                                     tag: page.pageOrderNumber())
        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navigationController: navigationController)
            let controller = HomeViewController()
            let homeViewModel = HomeViewModel()
            homeViewModel.coordinator = homeCoordinator
            controller.viewModel = homeViewModel
            childCoordinators.append(homeCoordinator)
            homeCoordinator.start()
            navController.pushViewController(controller, animated: true)
            
        case .favorite:
            let controller = FavoriteViewController()
            navController.pushViewController(controller, animated: true)
            
        case .account:
            let controller = ProfileViewController()
            navController.pushViewController(controller, animated: true)
        }
        return navController
    }
}
