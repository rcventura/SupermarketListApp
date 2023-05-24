//
//  Helper.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 17/05/23.
//

import Foundation

final class Helper {
        
    static var shared = Helper()
    
    var categoryItems: [String] = []
    var itemsAdded: [String : [String]] = [:]
    var listCreated: [String : [ItemDetailModel]] = [:]
}
