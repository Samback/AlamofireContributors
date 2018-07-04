//
//  ContributorsConfigurator.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorsConfiguratorProtocol: class {
    func config(with viewController: ContributorsViewController)
}

class ContributorsConfigurator {

}

extension ContributorsConfigurator: ContributorsConfiguratorProtocol {
    func config(with viewController: ContributorsViewController) {
        let loader = ContributorsDownloadService()
        let router = ContributorsRouter(with: viewController)
        let presenter = ContributorsPresenter(with: router, view: viewController, loader: loader)
        viewController.presenter = presenter

    }
}
