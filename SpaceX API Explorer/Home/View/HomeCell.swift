//
//  HomeCell.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 19.11.2020.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setHomeItem(_ item: HomeItem) {
        titleLabel.text = item.rawValue
    }
}
