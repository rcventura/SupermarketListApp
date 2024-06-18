//
//  CategoriesModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

struct CategoriesModel: Codable {
    let id: Int
    let nameCategories: String
    let image: Image

    enum CodingKeys: String, CodingKey {
        case id
        case nameCategories = "name_categories"
        case image
    }
}

    // MARK: - Image
struct Image: Codable {
    let access, path, name, type: String
    let size: Int
    let mime: String
    let meta: Meta
    let url: String
}

    // MARK: - Meta
struct Meta: Codable {
    let width, height: Int
}
