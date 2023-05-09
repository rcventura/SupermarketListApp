//
//  BaseTabBar.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

enum TabBarNames: Int {
    case home
    case favorite
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .favorite
        case 2:
            self = .profile
        default:
            return nil
        }
    }
    
    func setTabBarItemsTitle() -> String {
        switch self {
        case .home:
            return "Inicio"
        case .favorite:
            return "Favoritos"
        case .profile:
            return "Perfil"
        }
    }
    
    func setTabBarItemsImage() -> UIImage? {
        var imageName = ""
        switch self {
        case .home:
            imageName = "house"
        case .favorite:
            imageName = "heart"
        case .profile:
            imageName = "person"
        }
        return UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .favorite:
            return 1
        case .profile:
            return 2
        }
    }
}

class BaseTabBar: UITabBarController, UITabBarControllerDelegate {
    
}
