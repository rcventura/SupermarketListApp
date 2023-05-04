//
//  CategoriesViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 10/04/23.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    private let mainView: CategoriesView = .init()
    
    init(listTitle: String) {
        
        mainView.categoryTitle.text = listTitle.firstUppercased
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
    }
    
    @objc func cancelList() {
        showSimpleAlert(title: "Atenção",
                        message: "Deseja realmente excluir sua lista?",
                        customTitle: "Cancelar",
                        cancelTitle: "Sim") { _ in
            self.dismiss(animated: true)
        }
        
    }
}



extension CategoriesViewController {
    private func addLayout() {
        title = "Categorias"
        navigationItem.hidesBackButton = true
        let iconImage = UIImage(systemName: "trash")?.withRenderingMode(.alwaysTemplate)
        let trashIcon = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(cancelList))
        navigationItem.rightBarButtonItem = trashIcon
        navigationController?.navigationBar.tintColor = .red
    }
}

