//
//  AuthLoginRequest.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 28/07/23.
//

import Foundation

struct AuthLoginRequest: Codable {
    let email: String?
    let password: String?
}
