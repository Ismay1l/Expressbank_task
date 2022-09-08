//
//  AppDelegate.swift
//  Test_Project
//
//  Created by USER11 on 9/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainNavigationController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

