//
//  ExploreItem.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

protocol ExploreItem {
    var kind: ExploreKind {get}
    func getTitle() -> String
}
