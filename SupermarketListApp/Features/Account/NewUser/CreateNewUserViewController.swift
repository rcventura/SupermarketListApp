//
//  CreateNewUserViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import UIKit

final class CreateNewUserViewController: UIViewController {
    
    let mainView: CreateNewUserView = .init()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}

extension CreateNewUserViewController {
    private func addLayout() {
//        addComponentsActions()
    }
}
