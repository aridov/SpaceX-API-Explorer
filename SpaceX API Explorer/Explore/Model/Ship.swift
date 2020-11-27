//
//  Ship.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

struct Ship: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Ship: ExploreItem {
    func getTitle() -> String {
        return name
    }
}
