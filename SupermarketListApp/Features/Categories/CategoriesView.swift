//
//  CategoriesView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 05/05/23.
//

import UIKit

protocol CategoriesViewDelegate: AnyObject {
    func didSelectItem(indexPath: IndexPath)
}

final class CategoriesView: UIView {
    
    weak var delegate: CategoriesViewDelegate?
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
        collectionViewLayout.itemSize = CGSize(width: 90, height: 90)
        collectionViewLayout.minimumLineSpacing = 40
        
        addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20)
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

extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.reuseId, for: indexPath)
        
        if let cell = cell as? CategoriesCollectionViewCell {
            cell.setup()
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectItem(indexPath: indexPath)
    }
}

extension CategoriesView {
    private func addLayout() {
        addCollectionView()
        backgroundColor = SuperMarketColor.white
    }
}
