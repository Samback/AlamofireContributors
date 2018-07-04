//
//  ViewController.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/4/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import Foundation
import UIKit


protocol ViewControllerProtocol: class {
    func startSpinner()
    func stopSpinner()
}

class ViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
}

extension ViewController: ViewControllerProtocol {
    func startSpinner() {
        view.addSubview(spinner)
        spinner.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
        }
        spinner.startAnimating()
    }

    func stopSpinner() {
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
}
