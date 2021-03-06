//
//  ContributorsRouter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorsRouterProtocol: class {
    var view: ContributorsViewController? { get set }
    func openNextScreen(with contributor: Contributor)
}

class ContributorsRouter {
    // MARK: - Public variables
    internal weak var view: ContributorsViewController?
    
    // MARK: - Initialization
    init(with view: ContributorsViewController) {
        self.view = view
    }
}

extension ContributorsRouter: ContributorsRouterProtocol {
    func openNextScreen(with contributor: Contributor) {
        let contributorViewController = ContributorProvider(with: contributor).instantiate()
        view?.navigationController?.pushViewController(contributorViewController, animated: true)
    }
}
