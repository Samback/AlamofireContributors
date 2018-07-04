//
//  ContributorConfigurator.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorConfiguratorProtocol: class {
    func config(with viewController: ContributorViewController)
}

class ContributorConfigurator {
    private let contributor: Contributor
    init(with contributor: Contributor) {
        self.contributor = contributor
    }
}

extension ContributorConfigurator: ContributorConfiguratorProtocol {
    func config(with viewController: ContributorViewController) {
        let router = ContributorRouter(with: viewController)
        let presenter = ContributorPresenter(with: router, view: viewController, contributor: contributor)
        viewController.presenter = presenter
    }
}
