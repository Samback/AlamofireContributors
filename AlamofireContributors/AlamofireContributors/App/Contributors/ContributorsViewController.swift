//
//  ContributorsViewController.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher
import Rswift

protocol ContributorsViewProtocol: class {
    func reloadTable()
    func configTableView()
    func configUI()
}

class ContributorsViewController: UIViewController {
    // MARK: - Public properties
    var presenter: (ContributorsPresenterProtocol & ContributorsPresenterDataSourceProtocol)?
    var configurator: ContributorsConfiguratorProtocol?
    
    // MARK: - Private properties
    
    @IBOutlet private weak var tableView: UITableView?
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurator?.config(with: self)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Display logic
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
}

extension ContributorsViewController: ContributorsViewProtocol {
    func configUI() {
        title = presenter?.title
    }

    func reloadTable() {
        tableView?.reloadData()
    }

    func configTableView() {
        tableView?.backgroundColor = .clear
        tableView?.tableFooterView = UIView(frame: .zero)
        tableView?.rowHeight = ContributorCell.cellHeight
        tableView?.register(ContributorCell.self, forCellReuseIdentifier: ContributorCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
}

extension ContributorsViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfContributors(at: section) ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: ContributorCell.identifier, for: indexPath) as? ContributorCell else {
            fatalErrorCreation(message: "ContributorCell.identifier")
        }
        config(cell, at: indexPath)
        return cell
    }

    private func config(_ cell: ContributorCell, at indexPath: IndexPath) {
        guard let contributor = presenter?.contributor(at: indexPath) else {
            fatalError("We can't to find contributor")
        }

        cell.textLabel?.text = contributor.name
        cell.imageView?.kf.setImage(with: contributor.imageURL, placeholder: R.image.placeholder(),
                                    options: [.fromMemoryCacheOrRefresh])
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

extension ContributorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.tap(at: indexPath)
    }
}
