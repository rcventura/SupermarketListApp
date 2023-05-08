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
        addLayout()
    }
    
}

extension CategoriesViewController {
    private func addLayout() {
        title = "Categorias"
    }
}
