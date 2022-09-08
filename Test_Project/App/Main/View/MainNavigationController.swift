//
//  MainNavigationController.swift
//  Test_Project
//
//  Created by USER11 on 9/7/22.
//

import UIKit

class MainNavigationController: UINavigationController {

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureChildVC()
    }
    
    //MARK: - Functions
    private func configureChildVC() {
        let mainVC = MainVC()
        navigationBar.prefersLargeTitles = false
        mainVC.navigationItem.title = "Bonuses ↓"
        
        viewControllers = [mainVC]
    }
}
