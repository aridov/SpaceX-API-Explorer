//
//  NetworkService.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 21.11.2020.
//

import Foundation

fileprivate enum spacexURL: String {
    case capsules = "Capsules/"
    case dragons = "Dragons/"
    case rockets = "Rockets/"
    case ships = "Ships/"
}

class NetworkService {
    typealias ExploreRequestResult = (Result<[ExploreItem], Error>) -> Void
    
    func fetchItems(for exploreItem: ExploreItem, completion: ExploreRequestResult) {
        switch exploreItem.kind {
        case .Capsules:
            fetchCapsules(completion)
        case .Dragons:
            fetchDragons(completion)
        case .Rockets:
            fetchRockets(completion)
        case .Ships:
            fetchShips(completion)
        }
    }
    
    func fetchCapsules(_ completion: ExploreRequestResult) {
            
    }
        
    func fetchDragons(_ completion: ExploreRequestResult) {
            
    }
       
    func fetchRockets(_ completion: ExploreRequestResult) {
        
    }
    
    func fetchShips(_ completion: ExploreRequestResult) {
        
    }
}
