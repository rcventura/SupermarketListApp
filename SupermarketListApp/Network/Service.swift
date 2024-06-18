//
//  Service.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import Foundation

protocol Service {
    typealias Completion<T> = (_ result: Result<T, Error>) -> ()
}
