//
//  CategoriesViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 04/05/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    
    let mainView: CategoriesView = .init()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        addLayout()
    }
    
}
extension CategoriesViewController: CategoriesViewDelegate {
    func didSelectItem(indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            print("Primeiro Item")
        case 1:
            print("Segundo Item")
        case 2:
            print("Terceiro Item")
        default:
            print("Todos os Items")
        }
    }
}

extension CategoriesViewController {
    private func addLayout() {
        title = "Categorias"
        navigationController?.navigationBar.backgroundColor = SuperMarketColor.blue_BDD1DE
    }
}
