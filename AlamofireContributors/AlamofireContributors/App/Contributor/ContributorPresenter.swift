//
//  ContributorPresenter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorPresenterProtocol: class {
    var view: ContributorViewProtocol? { get set }
    func viewDidLoad()
    var title: String { get }
    var imageURL: URL? { get }
    var contributorDescription: String { get }
}

class ContributorPresenter {
    // MARK: - Public variables
    internal weak var view: ContributorViewProtocol?
    // MARK: - Private variables
    private let router: ContributorRouterProtocol
    private let contributor: Contributor
    
    // MARK: - Initialization
    init(with router: ContributorRouterProtocol, view: ContributorViewProtocol, contributor: Contributor ) {
        self.contributor = contributor
        self.router = router
        self.view = view
    }
}

extension ContributorPresenter: ContributorPresenterProtocol {
    var title: String {
        return contributor.name ?? ""
    }

    var imageURL: URL? {
        return contributor.imageURL
    }

    var contributorDescription: String {
        return "sdvhsgvukasvsadv"
    }

    
    func viewDidLoad() {
        view?.configUI()
    }
    
}
