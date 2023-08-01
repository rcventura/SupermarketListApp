//
//  ListItemsCategory.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

struct ListItemCategory: Codable {
    let id: Int
    let createdAt: Int
    let categoriesID: Int
    let itemTitle: [ItemTitle]
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case categoriesID = "categories_id"
        case itemTitle
    }
}

struct ItemTitle: Codable {
    let itemTitle: String
}
