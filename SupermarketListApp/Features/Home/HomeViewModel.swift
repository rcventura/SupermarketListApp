//
//  HomeViewModel.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didSuccess()
    func didError(message: String)
}

final class HomeViewModel {
    weak var coordinator: HomeCoordinator?
    weak var delegate: HomeViewModelDelegate?
    let service: ApiService = .init()
}

extension HomeViewModel {
    func getCreatedList() {
        service.getCreatedLists(userID: Helper.shared.userID, completion: {(result) in
            switch result {
            case .success(let result):
                Helper.shared.userShoppingList = result
                self.delegate?.didSuccess()
            case .failure(let error):
                self.delegate?.didError(message: error.localizedDescription)
            }
        })
    }
}

// MARK: - CORDINATOR CALL
extension HomeViewModel {    
    func createNewSuperMarketList(listTitle: String, placeOfCreation: Bool) {
        self.coordinator?.newSuperMarketList(listTitle: listTitle, placeOfCreation: placeOfCreation)
    }
    
    
    func openAddShoopingList() {
        coordinator?.openAddShoppingListViewController()
    }
}
