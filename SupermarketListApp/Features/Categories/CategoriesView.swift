//
//  CategoriesView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 10/04/23.
//

import UIKit

class CategoriesView: UIView {

    let nameCategoryLabel = UILabel()
    let categoryTitle = UILabel()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoriesView {
    private func addNameCategoryLabel() {
        addSubview(nameCategoryLabel)
        
        nameCategoryLabel.text = "Nome da lista"
        nameCategoryLabel.font = UIFont(name: "Arial", size: 15)
        nameCategoryLabel.textColor = SuperMarketColor.gray_AFAFAF
        nameCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameCategoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nameCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameCategoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
    }
    private func addCategoryTitle() {
        addSubview(categoryTitle)
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        categoryTitle.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: nameCategoryLabel.bottomAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}

extension CategoriesView {
    private func addLayout() {
        addNameCategoryLabel()
        addCategoryTitle()
        
        backgroundColor =  SuperMarketColor.blue_BDD1DE
    }
}
