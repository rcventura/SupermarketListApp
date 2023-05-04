//
//  SuperMarketButton.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

class SuperMarketButton: UIButton {
    
    init(title: String = "", backgroundColor: UIColor = SuperMarketColor.white) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setCornerRadius(cornerRadius: 5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
}
