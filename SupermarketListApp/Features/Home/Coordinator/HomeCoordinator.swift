//
//  HomeCoordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func newSuperMarketList(listTitle: String) {
        let controller = UINavigationController(rootViewController: CategoriesViewController(listTitle: listTitle))
        controller.modalPresentationStyle = .overFullScreen
        controller.hidesBottomBarWhenPushed = true
        
        self.navigationController.present(controller, animated: true)
    }
}
