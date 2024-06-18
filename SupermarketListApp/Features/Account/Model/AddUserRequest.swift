//
//  AddUserRequest.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 18/06/24.
//

import Foundation

struct AddUserRequest: Codable {
    let name: String
    let email: String
    let password: String
}
