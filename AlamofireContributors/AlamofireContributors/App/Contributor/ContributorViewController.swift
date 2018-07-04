//
//  ContributorViewController.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Kingfisher

protocol ContributorViewProtocol: class {
   func configUI()
}

class ContributorViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ContributorPresenterProtocol?
    var configurator: ContributorConfiguratorProtocol?
    @IBOutlet private weak var avatarView: CircleImageView?
    @IBOutlet private weak var descriptionLabel: UILabel?
    // MARK: - Private properties
    
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

extension ContributorViewController:  ContributorViewProtocol {
    func configUI() {

        configDescriptionLabel()
        configImageView()
        navigationBarConfig()
    }

    private func navigationBarConfig() {
        title = presenter?.title
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    private func configImageView() {
         avatarView?.kf.setImage(with: presenter?.imageURL, placeholder: R.image.placeholder())
    }

    private func configDescriptionLabel() {
        descriptionLabel?.text = presenter?.contributorDescription
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.lineBreakMode = .byWordWrapping
    }


}
