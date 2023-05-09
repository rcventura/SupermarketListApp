//
//  CategoriesCollectionViewCell.swift
//  SupermarketListApp
//
//  Created by PremierSoft on 08/05/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    let categoryImage = UIImageView()
    let categoryTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCategoryImage()
        addCategoryTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCategoryImage() {
        addSubview(categoryImage)
        
        categoryImage.contentMode = .scaleAspectFill
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            categoryImage.heightAnchor.constraint(equalToConstant: self.bounds.size.width),
        ])
    }
    
    func addCategoryTitle() {
        addSubview(categoryTitle)
        
        categoryTitle.text = "Limpeza"
        categoryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 5),
            categoryTitle.centerXAnchor.constraint(equalTo: categoryImage.centerXAnchor)
        ])
    }
    
    func setup() {
        categoryImage.image = UIImage(named: "imageteste")
    }
    
}
