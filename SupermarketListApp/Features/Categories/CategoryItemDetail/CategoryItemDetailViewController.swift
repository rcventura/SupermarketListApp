//
//  CategoryItemDetailViewController.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 19/05/23.
//

import UIKit

class CategoryItemDetailViewController: UIViewController {
    
    let mainView: CategoryItemDetailView = .init()
    
    init(itemSelectedIndex: IndexPath, itemSelectedName: String ) {
        super.init(nibName: nil, bundle: nil)
        mainView.itemTitleLabel.text = itemSelectedName
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
}

extension CategoryItemDetailViewController {
    
    private func actionComponentsView() {
        mainView.saveButton.addTarget(self, action: #selector(saveList), for: .touchUpInside)
    }
    
    @objc private func saveList() {
        guard let title = mainView.itemTitleLabel.text else { return }
        guard let brand = mainView.brandTextField.text else { return }
        
        Helper.shared.itemsAdded.append((ItemDataModel.init(itemTitle: title, itemDetal: [itemDetail.init(itemBrand: brand)])))
        print("Item adicionado: \(Helper.shared.itemsAdded)")
        self.navigationController?.popViewController(animated: true)
    }
}

extension CategoryItemDetailViewController {
    private func addLayout() {
        title = "Dados do item"
        actionComponentsView()
    }
}
