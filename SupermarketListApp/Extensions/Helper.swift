//
//  Helper.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 17/05/23.
//

import Foundation

final class Helper {
        
    static var shared = Helper()
    
    var itemsAdded: [(ItemDataModel)] = []
    var listCreated: [(nomeList: String, itemsList: [ItemDataModel])] = []
    
}
