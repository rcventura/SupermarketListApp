//
//  CategoriesView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 05/05/23.
//

import UIKit

final class CategoriesView: UIView {


    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoriesView {
    private func addLayout() {
        backgroundColor = SuperMarketColor.blue_BDD1DE
    }
}
