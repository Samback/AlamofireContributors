//
//  ContributorsProvider.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Rswift

protocol ContributorsProviderProtocol {
    func instantiate() -> ContributorsViewController
}

class ContributorsProvider {
}

extension ContributorsProvider: ContributorsProviderProtocol {
    func instantiate() -> ContributorsViewController {

        let configurator = ContributorsConfigurator()
        guard let viewController = R.storyboard.main.contributorsViewController() else {
            fatalError("Can't instantiate R.storyboard.main.contributorsViewController")
        }
        viewController.configurator = configurator

        return viewController
    }
}
