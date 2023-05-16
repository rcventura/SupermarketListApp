//
//  HomeViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import Foundation

final class HomeViewModel {
    
    weak var coordinator: HomeCoordinator?
    var listascriadas: [String] = []
    
}

// MARK: - CORDINATOR CALL
extension HomeViewModel {    
    func createNewSuperMarketList(listTitle: String) {
        self.coordinator?.newSuperMarketList(listTitle: listTitle)
    }
}
