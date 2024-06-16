//
//  KeyChainManager.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 11/06/24.
//

import Foundation
import Security

enum KeychainError: LocalizedError {
    /// The requested item was not found in the Keychain.
    case itemNotFound
    /// Attempted to save an item that already exists.
    /// Update the item instead.
    case duplicateItem
    /// The operation resulted in an unexpected status.
    case unexpectedStatus(OSStatus)
}


class KeyChainManager {
    static func saveToKeyChain(authToken: String) throws {
        let query: [String: AnyObject] = ([
            kSecAttrTokenID: authToken
        ] as CFDictionary) as! [String : AnyObject]
        
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            if status == errSecDuplicateItem {
                throw KeychainError.duplicateItem
            }
            throw KeychainError.unexpectedStatus(status)
        }
    }
}
