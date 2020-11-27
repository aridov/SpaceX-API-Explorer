//
//  NetworkService.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 21.11.2020.
//

import Foundation

fileprivate enum SpacexURL: String {
    case capsules = "https://api.spacexdata.com/v4/capsules"
    case dragons = "https://api.spacexdata.com/v4/dragons"
    case rockets = "https://api.spacexdata.com/v4/rockets"
    case ships = "https://api.spacexdata.com/v4/ships"
}

extension SpacexURL {
    func getTitle() -> String {
        return self.rawValue
    }
}

class NetworkService {
    typealias ExploreRequestResult = (Result<[ExploreItem], Error>) -> Void
    
    func fetchItems(for kind: ExploreKind, completion: @escaping ExploreRequestResult) {
        guard let url = URL(string: getUrlString(for: kind)) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            self.decode(for: kind, from: data, completion: completion)
        }.resume()
    }
    
    fileprivate func getUrlString(for kind: ExploreKind) -> String {
        var urlString = ""
        
        switch kind {
        case .Capsules:
            urlString = SpacexURL.capsules.getTitle()
        case .Dragons:
            urlString = SpacexURL.dragons.getTitle()
        case .Rockets:
            urlString = SpacexURL.rockets.getTitle()
        case .Ships:
            urlString = SpacexURL.ships.getTitle()
        }

        return urlString
    }
    
    fileprivate func decode(for kind:ExploreKind, from data: Data, completion: @escaping ExploreRequestResult) {
        do {
            var exploreData = [ExploreItem]()
            let decoder = JSONDecoder()
            switch kind {
            case .Capsules:
                exploreData = try decoder.decode([Capsule].self, from: data)
            case .Dragons:
                exploreData = try decoder.decode([Dragon].self, from: data)
            case .Rockets:
                exploreData = try decoder.decode([Rocket].self, from: data)
            case .Ships:
                exploreData = try decoder.decode([Ship].self, from: data)
            }
            completion(.success(exploreData))
        } catch let error {
            completion(.failure(error))
        }
    }
}
