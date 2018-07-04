//
//  ContributorCell.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import UIKit

final class ContributorCell: UITableViewCell {
    static let identifier = "ContributorCell"
    static let cellHeight: CGFloat = 60
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ContributorCell.identifier)

        let radius = (ContributorCell.cellHeight / 2).rounded(.up)
        imageView?.layer.cornerRadius = radius
        imageView?.layer.masksToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
