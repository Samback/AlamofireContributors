//
//  AppDelegate.swift
//  AlamofireContributors
//
//  Created by Max Tymchii on 7/3/18.
//  Copyright © 2018 Max Tymchii. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        showContributorsScreen()
        return true
    }

    private func showContributorsScreen() {
        let navigationController = UINavigationController(rootViewController: ContributorsProvider().instantiate())
        window?.rootViewController = navigationController
    }
}

