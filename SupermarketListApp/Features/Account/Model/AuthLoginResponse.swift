//
//  AuthLoginResponse.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 11/06/24.
//

import Foundation

struct AuthLoginResponse: Codable {
    let authToken: String
    let user: User

    // MARK: - User
    struct User: Codable {
        let id: Int
        let name: String
        let email: String
    }
}
