//
//  FavoriteCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 09/05/23.
//

import UIKit

final class FavoriteCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = FavoriteViewController()
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
}
    
