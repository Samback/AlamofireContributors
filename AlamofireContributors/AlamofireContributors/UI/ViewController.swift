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
    func showAlert(with error: Error)
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

    func showAlert(with error: Error) {
        let alertViewControler = UIAlertController(title: "Error", message: error.localizedDescription,
                                                   preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertViewControler.addAction(ok)
        present(alertViewControler, animated: true, completion: nil)
    }
}
