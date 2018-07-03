//
//  ContributorsPresenter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorsPresenterProtocol: class {
    var view: ContributorsViewProtocol? { get set }
    func viewDidLoad()
}

class ContributorsPresenter {
    // MARK: - Public variables
    internal weak var view: ContributorsViewProtocol?
    // MARK: - Private variables
    private let router: ContributorsRouterProtocol
    
    // MARK: - Initialization
    init(with router: ContributorsRouterProtocol, view: ContributorsViewProtocol) {

        self.router = router
        self.view = view

    }
}

extension ContributorsPresenter: ContributorsPresenterProtocol {
    
    func viewDidLoad() {

    }
    
}
