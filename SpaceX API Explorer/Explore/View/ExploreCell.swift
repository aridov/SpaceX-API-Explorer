//
//  ExploreCell.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 27.11.2020.
//

import UIKit

class ExploreCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setExploreItem(_ item: ExploreItem) {
        titleLabel.text = item.getTitle()
    }
}
