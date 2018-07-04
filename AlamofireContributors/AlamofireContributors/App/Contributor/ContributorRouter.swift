//
//  ContributorRouter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorRouterProtocol: class {
    var view: ContributorViewController? { get set }
    func openNextScreen()
}

class ContributorRouter {
    // MARK: - Public variables
    internal weak var view: ContributorViewController?
    
    // MARK: - Initialization
    init(with view: ContributorViewController) {
        self.view = view
    }
}

extension ContributorRouter: ContributorRouterProtocol {
    func openNextScreen() {

    }
}
