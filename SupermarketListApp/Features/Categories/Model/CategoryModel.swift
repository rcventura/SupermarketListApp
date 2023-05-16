//
//  CategoryModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

// MARK: - CategoryList
struct CategoryList: Codable {
    let category: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id: Int?
    let title: String?
    let item: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let itemTitle: String?
}
