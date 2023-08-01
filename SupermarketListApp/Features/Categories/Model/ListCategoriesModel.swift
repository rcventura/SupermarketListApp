//
//  ListCategoriesModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

struct ListCategoriesModel: Codable {
    let id: Int
    let nameCategories: String
    let image: String
        
    enum CodingKeys: String, CodingKey {
        case id
        case nameCategories = "name_categories"
        case image
    }
}
