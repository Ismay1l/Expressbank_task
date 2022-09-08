//
//  CardView.swift
//  Test_Project
//
//  Created by USER11 on 9/7/22.
//

import UIKit
import SnapKit

class CardView: UIView {
    
    //MARK: - UI Elements
    private lazy var cardImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "ic_card"))
        return image
    }()
    
    //MARK: - Parent Delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {
        addSubview(cardImage)
        
        cardImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
