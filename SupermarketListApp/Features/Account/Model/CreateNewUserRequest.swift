//
//  CreateNewUserRequest.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

struct CreateNewUserRequest: Codable {
    let name: String?
    let email: String
    let password: String
}
