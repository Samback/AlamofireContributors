//
//  ContributorsProvider.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorsProviderProtocol {
    func instantiate() -> ContributorsViewController
}

class ContributorsProvider {
}

extension ContributorsProvider: ContributorsProviderProtocol {
    func instantiate() -> ContributorsViewController {

        let configurator = ContributorsConfigurator()
        let viewController = ContributorsViewController()
        viewController.configurator = configurator

        return viewController
    }
}
