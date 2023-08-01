//
//  CategoriesView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 05/05/23.
//

import UIKit

final class CategoriesView: UIView {
    
    var collectionView: UICollectionView
    var collectionViewLayout = UICollectionViewFlowLayout()
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCollectionView() {
        collectionViewLayout.itemSize = CGSize(width: 85, height: 85)
        collectionViewLayout.minimumLineSpacing = 60
        
        addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 30, bottom: 0, right: 30)
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension CategoriesView {
    private func addLayout() {
        addCollectionView()
        backgroundColor = SMColor.white
    }
}
