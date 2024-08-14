//
//  Helper.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 17/05/23.
//

import Foundation

final class Helper {
    static var shared = Helper()
    
    var listItemAdded: [ItemsList] = []
    var userShoppingList: [AddListResponse] = []
    var userAuthToken = String()
    var userID = Int()
}
