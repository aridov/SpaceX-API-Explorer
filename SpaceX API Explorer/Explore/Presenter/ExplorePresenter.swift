//
//  ExplorePresenter.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import Foundation

protocol ExploreProtocol {
    func startLoading()
    func finishLoading()
    func setItems(_ items: [ExploreItem])
}

class ExplorePresenter {
    fileprivate var kind: ExploreKind
    fileprivate var items = [ExploreItem] ()
    
    init(from kind: ExploreKind) {
        self.kind = kind
    }
    
    var title: String {
        return kind.getTitle()
    }
    
    var numberOfRows: Int {
        return items.count
    }
    
    func getItem(by index: Int) -> ExploreItem {
        return items[index]
    }
}
