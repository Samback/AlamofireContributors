//
//  ContributorsViewController.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright (c) 2018 Max Tymchii. All rights reserved.
//

import UIKit

protocol ContributorsViewProtocol: class {
   
}

class ContributorsViewController: UIViewController {
    // MARK: - Public properties
    var presenter: ContributorsPresenterProtocol?
    var configurator: ContributorsConfiguratorProtocol?
    
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

extension ContributorsViewController:  ContributorsViewProtocol {

}
