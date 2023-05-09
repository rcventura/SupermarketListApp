//
//  HomeViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import UIKit

final class HomeViewController: UIViewController {
    private let mainView: HomeView = .init()
    var viewModel =  HomeViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addLayout()
    }
}

extension HomeViewController {
    @objc func createNewMarketList() {
        showAlertWithTextField(title: "Nova Lista",
                               message: "Vamos dar um nome a sua nova lista de compras?",
                               customTitle: "Criar",
                               cancelTitle: "Cancelar",
                               textFieldPlaceholder: "Nome da lista",
                               inputKeyboardType: .asciiCapable,
                               actionHandler:  { title in
            guard let title = title else { return }
            if title == ""{
                self.showSimpleAlert(title: "Atenção", message: "É necessário inserir o nome da lista de compras", customHandler: { _ in
                    self.createNewMarketList()
                })
            } else {
                self.viewModel.createNewSuperMarketList(listTitle: title)
            }
        })
    }
}

extension HomeViewController {
    private func addLayout() {
        title = "Principal"
        
        navigationItem.hidesBackButton = true
        
        let iconImage = UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate)
        let trashIcon = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(createNewMarketList))
        navigationItem.rightBarButtonItem = trashIcon
        navigationController?.navigationBar.tintColor = .blue.withAlphaComponent(0.5)
    }
}
