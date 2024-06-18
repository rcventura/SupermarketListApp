//
//  SuperMarketButton.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

class SMButton: UIButton {
    
    init(title: String = "", enabledBackgroundColor: UIColor = SMColor.white, disabledBackgroundColor: UIColor? = nil) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.enabledBackgroundColor = enabledBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.setCornerRadius(cornerRadius: 10)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var enabledBackgroundColor: UIColor? = SMColor.blue_066699 {
        didSet {
            backgroundColor = isEnabled ? enabledBackgroundColor : disabledBackgroundColor
        }
    }
    
    public var disabledBackgroundColor: UIColor? = SMColor.blue_066699
    
    func setCornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    public override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? enabledBackgroundColor : disabledBackgroundColor
        }
    }
    
    private func setup() {
        backgroundColor = isEnabled ? enabledBackgroundColor : disabledBackgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
