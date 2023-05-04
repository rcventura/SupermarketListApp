//
//  String+Extension.swift
//  SupermarketListApp
//
//  Created by PremierSoft on 03/05/23.
//

import Foundation

// PUTTING UPPERCASE THE FIRST LETTER OF SENTENCE
extension String {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}
