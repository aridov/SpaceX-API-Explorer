//
//  HomeItems.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 18.11.2020.
//

import Foundation

enum ExploreKind: String, CaseIterable {
    case Capsules
    case Dragons
    case Rockets
    case Ships
}

extension ExploreKind {
    func getTitle() -> String {
        return self.rawValue
    }
}
