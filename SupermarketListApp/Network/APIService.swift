//
//  ApiService.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 15/05/23.
//

import Foundation

class ApiService {
    
    var categoryCount = Int()
    var categoryName: [String] = []
    var category: [Category] = []
    var categoryItems: [String] = []
    
    // GET CATEGORIES FROM LOCAL JSON
    func getCategories() {
        guard let url = Bundle.main.url(forResource: "categoriesJson", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(CategoryList.self, from: data)
            
            self.category = json.category
            self.categoryCount = json.category.count
            
            json.category.forEach { result in
                categoryName.append(result.title ?? "")
            }
        } catch {
            print(error)
        }
    }
    
    // GET ITEMS OF CATEGORY BY ID
    func getItemsCategory(categoryID: Int) {
        guard let url = Bundle.main.url(forResource: "categoriesJson", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(CategoryList.self, from: data)
            
            
            category = json.category.filter({ id in
                id.id == categoryID
            })
            
            category.forEach { x in
                x.item?.forEach({ items in
                    self.categoryItems.append(items.itemTitle ?? "")
                })
            }
        } catch {
            print(error)
        }
    }
    
}
