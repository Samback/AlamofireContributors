//
//  ContributorsPresenter.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Alamofire

protocol ContributorsPresenterProtocol: class {
    var view: ContributorsViewProtocol? { get set }
    func viewDidLoad()
    func tap(at indexPath: IndexPath)
    var title: String { get }
}

protocol ContributorsPresenterDataSourceProtocol {
    func numberOfContributors(at section: Int) -> Int
    func contributor(at indexPath: IndexPath) -> Contributor?
}

class ContributorsPresenter {
    // MARK: - Public variables
    internal weak var view: ContributorsViewProtocol?
    // MARK: - Private variables
    private let router: ContributorsRouterProtocol
    private let loader: ContributorsDownloadProtocol
    private var contributors = [Contributor]()

    // MARK: - Initialization
    init(with router: ContributorsRouterProtocol, view: ContributorsViewProtocol, loader: ContributorsDownloadProtocol) {

        self.router = router
        self.loader = loader
        self.view = view
    }
}

extension ContributorsPresenter: ContributorsPresenterProtocol {
    var title: String {
        return "Alamofire Contributors"
    }

    func tap(at indexPath: IndexPath) {
        if indexPath.row < 0 || indexPath.row > contributors.count {
            return
        }

        let contributor = contributors[indexPath.row]
        router.openNextScreen(with: contributor)
    }
    
    func viewDidLoad() {
        view?.configTableView()
        view?.configUI()
        view?.startSpinner()
        loader.fetchContributors { [weak self] result in
            mainThread {
                self?.view?.stopSpinner()
                self?.parse(result)
            }
        }
    }

    private func parse(_ result: Result<[Contributor]>) {
        switch result {
        case .failure(let error):
            view?.showAlert(with: error)
        case .success(let contributors):
            self.contributors = contributors
            view?.reloadTable()
        }
    }
}

extension ContributorsPresenter: ContributorsPresenterDataSourceProtocol {

    func numberOfContributors(at section: Int) -> Int {
        if section == 0 {
            return contributors.count
        }
        return 0
    }

    func contributor(at indexPath: IndexPath) -> Contributor? {
        if indexPath.section == 0
            && indexPath.row >= 0
            && indexPath.row <= contributors.count {
            return contributors[indexPath.row]
        }
        return nil
    }
}
