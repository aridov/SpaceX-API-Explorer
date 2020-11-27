//
//  Rocket.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

struct Rocket: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Rocket: ExploreItem {
    var kind: ExploreKind {
        return .Rockets
    }
    
    func getTitle() -> String {
        return name
    }
}
