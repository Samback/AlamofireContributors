//
//  ContributorPresenter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Alamofire

typealias BlockInfo = (String, String)

protocol ContributorPresenterProtocol: class {
    var view: ContributorViewProtocol? { get set }
    func viewDidLoad()
    var title: String { get }
    var imageURL: URL? { get }
}

class ContributorPresenter {
    // MARK: - Public variables
    internal weak var view: ContributorViewProtocol?
    // MARK: - Private variables
    private let router: ContributorRouterProtocol
    private var contributor: Contributor
    private let loader: ContributorDownloadProtocol
    
    // MARK: - Initialization
    init(with router: ContributorRouterProtocol, view: ContributorViewProtocol, contributor: Contributor,
         loader: ContributorDownloadProtocol ) {
        self.loader = loader
        self.contributor = contributor
        self.router = router
        self.view = view
    }
}

extension ContributorPresenter: ContributorPresenterProtocol {
    func viewDidLoad() {
        view?.configUI()
        view?.startSpinner()
        loader.fetchContributor {[weak self] result in
            mainThread {
                self?.view?.stopSpinner()
                self?.parse(result)
            }
        }
    }

    private func parse(_ result: Result<Contributor>) {
        switch result {
        case .success(let item):
            contributor = item
            addInfoBlocks()
        case .failure(let error):
            view?.showAlert(with: error)
        }
    }

    private func addInfoBlocks() {
        view?.addBlockInfoView(for: company)
        view?.addBlockInfoView(for: blog)
        view?.addBlockInfoView(for: bio)
        view?.addEmptyView()
    }

    var blog: BlockInfo {
        return ("Blog", blogLink)
    }

    var bio: BlockInfo {
        return ("Biography", contributorDescription)
    }

    var company: BlockInfo {
        return ("Company", companyName)
    }

    var title: String {
        return contributor.name ?? String.textPlaceHolder
    }

    var imageURL: URL? {
        return contributor.imageURL
    }
    var contributorDescription: String {
        return contributor.bio ?? String.textPlaceHolder
    }

    var companyName: String {
        return contributor.company ?? String.textPlaceHolder
    }

    var blogLink: String {
        return contributor.blog ?? String.textPlaceHolder
    }

}
