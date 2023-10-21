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
        super.viewWillAppear(animated)
        mainView.tableView.reloadData()
        addNavigationRightItem()
    }
}

extension HomeViewController {
    
    private func actionComponentsView() {
        mainView.emptyView.newButton.addTarget(self, action: #selector(createNewMarketList), for: .touchUpInside)
    }
    
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
                self.showSimpleAlert(title: "Atenção", message: "É necessário inserir o nome da lista de compras", customHandler: { _,_  in
                    self.createNewMarketList()
                })
            } else {
                self.showSimpleAlert(title: "Atenção",
                                     message: "Lista criada de casa?",
                                     customTitle: "Sim",
                                     customHandler: { _, placeOfCreation  in
                    self.viewModel.createNewSuperMarketList(listTitle: title, placeOfCreation: placeOfCreation)
                },
                                     cancelTitle: "Não", cancelHandler: { _, placeOfCreation in
                    self.viewModel.createNewSuperMarketList(listTitle: title, placeOfCreation: placeOfCreation)
                },cancelTitleStyle: .default)
            }
        }
    )}
}

extension HomeViewController {
    private func delegates() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Helper.shared.listCreated.count == 0 {
            self.mainView.tableView.backgroundView = self.mainView.emptyView
            self.mainView.tableView.isScrollEnabled = false
        } else {
            mainView.tableView.backgroundView = .none
        }
        return Helper.shared.listCreated.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath)
        let titleLists = Array(Helper.shared.listCreated)
        
        cell.textLabel?.text = titleLists[indexPath.row].nomeList
        return cell
    }
}

extension HomeViewController {
    private func addLayout() {
        delegates()
        actionComponentsView()
        title = "Principal"
        navigationItem.hidesBackButton = true
    }
    
    private func addNavigationRightItem() {
        let iconImage = UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate)
        let trashIcon = UIBarButtonItem(image: iconImage, style: .plain, target: self, action: #selector(createNewMarketList))
        navigationItem.rightBarButtonItem = trashIcon
        navigationController?.navigationBar.tintColor = .blue.withAlphaComponent(0.5)
        if #available(iOS 16.0, *) {
            navigationItem.rightBarButtonItem?.isHidden = Helper.shared.listCreated.count == 0 ? true : false
        }
    }
}
