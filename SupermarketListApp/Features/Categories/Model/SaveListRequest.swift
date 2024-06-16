//
//  SaveListRequest.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 07/08/23.
//

import Foundation

struct SaveListResponse: Codable {
    let userID: Int
    let nameList: String
    var itemsList: [ItemsList]
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case nameList
        case itemsList
    }
}

// MARK: - ItemsList
struct ItemsList: Codable {
    let itemTitle: String
    let itemDetal: [ItemDetail]?
}

// MARK: - ItemDetail
struct ItemDetail: Codable {
    let itemBrand: String?
    let itemPrice: Double?
    let itemQuantitity: Double?
    let itemType: String?
}
