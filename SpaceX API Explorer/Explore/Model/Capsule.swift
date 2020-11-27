//
//  Capsule.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

struct Capsule: Codable {
    var serial: String
    
    enum CodingKeys: String, CodingKey {
        case serial
    }
}

extension Capsule: ExploreItem {
    func getTitle() -> String {
        return serial
    }
}
