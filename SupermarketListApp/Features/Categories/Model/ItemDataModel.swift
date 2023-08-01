//
//  ItemDataModel.swift
//  SupermarketListApp
//
//  Created by PremierSoft on 26/05/23.
//

import Foundation

struct ItemDataModel {
    var itemTitle: String
    var itemDetal: [itemDetail]
}

struct itemDetail {
    var itemBrand: String?
    var itemPrice: Float?
    var itemQuantitity: Float?
    var itemType: String?
}
