//
//  ShoppingListCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import UIKit

final class ShoppingListCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func openCategoriesController() {
        let controller = UINavigationController(rootViewController: CategoriesViewController())
        controller.hidesBottomBarWhenPushed = true
        self.navigationController.present(controller, animated: true)
    }
}
