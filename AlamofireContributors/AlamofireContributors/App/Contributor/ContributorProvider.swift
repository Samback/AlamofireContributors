//
//  ContributorProvider.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Rswift

protocol ContributorProviderProtocol {
    func instantiate() -> ContributorViewController
}

class ContributorProvider {
    private let contributor: Contributor
    
    init(with contributor: Contributor) {
        self.contributor = contributor
    }
}

extension ContributorProvider: ContributorProviderProtocol {
    func instantiate() -> ContributorViewController {

        guard let viewController = R.storyboard.main.contributorViewController() else {
            fatalErrorCreation(message: R.storyboard.main.contributorViewController.identifier)
        }

        let configurator = ContributorConfigurator(with: contributor)
        viewController.configurator = configurator

        return viewController
    }
}
