//
//  Capsule.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

struct Capsule: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Capsule: ExploreItem {
    var kind: ExploreKind {
        return .Capsules
    }
    
    func getTitle() -> String {
        return name
    }
}
