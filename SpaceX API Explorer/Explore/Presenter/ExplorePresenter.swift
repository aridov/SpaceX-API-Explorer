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
    func reloadItems()
}

class ExplorePresenter {
    fileprivate var kind: ExploreKind
    fileprivate var items = [ExploreItem] ()
    
    fileprivate let networkService: NetworkService
    fileprivate var exploreView: ExploreProtocol?
    
    init(from kind: ExploreKind, networkService: NetworkService = NetworkService()) {
        self.kind = kind
        self.networkService = networkService
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
    
    func attachView(view: ExploreProtocol) {
        self.exploreView = view
    }
    
    func fetchItems() {
        exploreView?.startLoading()
        networkService.fetchItems(for: kind) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let items):
                        self?.items = items
                        self?.exploreView?.reloadItems()
                    case .failure(let error):
                        print(error)
                }
                
                self?.exploreView?.finishLoading()
            }
        }
    }
}
