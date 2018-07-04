//
//  CircleImageView.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import UIKit

final class CircleImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        let side = min(bounds.width, bounds.height)
        layer.cornerRadius = (side / 2).rounded(.up)
        layer.masksToBounds = true
    }
}
