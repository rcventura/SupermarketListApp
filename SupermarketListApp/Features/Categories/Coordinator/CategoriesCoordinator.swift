//
//  CategoriesCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import UIKit

class CategoriesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CategoriesViewModel()
        let controller = UINavigationController(rootViewController: CategoriesViewController(viewModel: viewModel))
        viewModel.coordinator = self
        controller.hidesBottomBarWhenPushed = true
        self.navigationController.present(controller, animated: true)
    }
    
    func CategoriesCoordinator(categoryId: Int) {
        let controller = CategoryItemListViewController(categoryId: categoryId)
        self.navigationController.pushViewController(controller, animated: true)
    }
}
