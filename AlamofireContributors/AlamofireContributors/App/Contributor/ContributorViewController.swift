//
//  ContributorViewController.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

protocol ContributorViewProtocol: ViewControllerProtocol {
    func configUI()
    func addBlockInfoView(for blockInfo: BlockInfo)
    func addEmptyView()
}

class ContributorViewController: ViewController {
    // MARK: - Public properties
    var presenter: ContributorPresenterProtocol?
    var configurator: ContributorConfiguratorProtocol?
    @IBOutlet private weak var avatarView: CircleImageView?
    @IBOutlet private weak var stackView: UIStackView!
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

    func addBlockInfoView(for blockInfo: BlockInfo) {
        let titleView = TitleLabel(frame: .zero)
        titleView.text = blockInfo.0
        let descriptionView = DescriptionLabel(frame: .zero)
        descriptionView.text = blockInfo.1
        let containerView = UIView(frame: .zero)
        containerView.addSubview(titleView)
        containerView.addSubview(descriptionView)
        stackView.addArrangedSubview(containerView)
        titleView.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
            maker.height.lessThanOrEqualTo(30)
        }
        descriptionView.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.top.equalTo(titleView.snp.bottom)
        }
    }

    func addEmptyView() {
        let view = UIView(frame: .zero)
        stackView.addArrangedSubview(view)
    }

    func configUI() {
        configStackView()
        configImageView()
        navigationBarConfig()
    }

    private func configStackView() {
        stackView.distribution = .fillProportionally
    }

    private func navigationBarConfig() {
        title = presenter?.title
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    private func configImageView() {
        avatarView?.kf.setImage(with: presenter?.imageURL, placeholder: R.image.placeholder())
    }

}
