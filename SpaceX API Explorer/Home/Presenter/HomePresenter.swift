//
//  HomePresenter.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 18.11.2020.
//

import Foundation

class HomePresenter {
    var numberOfRows: Int {
        return ExploreKind.allCases.count
    }
    
    func getItem(by index: Int) -> ExploreKind {
        return ExploreKind.allCases[index]
    }
}
