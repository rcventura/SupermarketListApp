//
//  CategoryItemListTableViewCell.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 18/05/23.
//

import UIKit

final class CategoryItemListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if isSelected {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }
}

