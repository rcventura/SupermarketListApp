//
//  Coordinator.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
