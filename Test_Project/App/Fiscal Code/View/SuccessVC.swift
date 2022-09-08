//
//  SuccessVC.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import UIKit

class SuccessVC: UIViewController {
    
    //MARK: - variables
    let successView = SuccessView()

    //MARK: - Parent delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        view.addSubview(successView)
        
        let left = view.safeAreaLayoutGuide.snp.left
        let right = view.safeAreaLayoutGuide.snp.right
        
        successView.snp.makeConstraints { make in
            make.left.equalTo(left).offset(44)
            make.right.equalTo(right).offset(-44)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY)
            make.height.equalTo(291)
        }
    }
}
