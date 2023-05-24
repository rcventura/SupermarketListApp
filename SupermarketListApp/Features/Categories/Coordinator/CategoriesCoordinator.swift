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
    var placeOfCreation = Bool()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CategoriesViewModel()
        let controller = UINavigationController(rootViewController: CategoriesViewController(viewModel: viewModel, placeOfCreation: self.placeOfCreation))
        viewModel.coordinator = self
        controller.hidesBottomBarWhenPushed = true
        self.navigationController.present(controller, animated: true)
    }
    
    func CategoriesCoordinator(categoryId: Int, placeOfCreation: Bool) {
        let controller = CategoryItemListViewController(categoryId: categoryId, placeOfCreation: placeOfCreation)
        let viewModel = CategoryItemListViewModel()
        controller.viewModel = viewModel
        viewModel.coordinator = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func openCategoriesController() {
        navigationController.popViewController(animated: false)
        let coordinator = self
        coordinator.start()
    }
    
    func openItemDetal(itemSelectedIndex: IndexPath, itemSelectedName: String) {
        let controller = CategoryItemDetailViewController(itemSelectedIndex: itemSelectedIndex, itemSelectedName: itemSelectedName)
        self.navigationController.pushViewController(controller, animated: true)
    }
}
