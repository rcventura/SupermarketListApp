//
//  Extension+UIImageView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

extension UIImageView {
    func fetchImage(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
