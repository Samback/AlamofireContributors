//
//  DescriptionLabel.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import UIKit

final class DescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configUI() {
        textColor = .black
        textAlignment = .left
        numberOfLines = 0
        font = UIFont.italicSystemFont(ofSize: 14)
    }
}
