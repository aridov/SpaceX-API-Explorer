//
//  Dragon.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

struct Dragon: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension Dragon: ExploreItem {
    func getTitle() -> String {
        return name
    }
}
