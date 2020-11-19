//
//  HomePresenter.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 18.11.2020.
//

import Foundation

//protocol HomePresenterProtocol {
//    func didSelect
//}

class HomePresenter {
    var numberOfRows: Int {
        return HomeItem.allCases.count
    }
    
    func getItem(by index: Int) -> HomeItem {
        return HomeItem.allCases[index]
    }
}
