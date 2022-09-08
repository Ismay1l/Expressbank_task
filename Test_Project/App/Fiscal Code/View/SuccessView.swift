//
//  SuccessView.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import UIKit

class SuccessView: UIView {
    
    //MARK: - UI Elements
    private lazy var successIconView: UIView = {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: "#F6F6F6")
        view.layer.cornerRadius = 68
        return view
    }()
    
    private lazy var successIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "ic_success"))
        return view
    }()
    
    private lazy var wellDoneLabel = createLabel(text: "Well Done", color: .black, size: 29, weight: .bold)
    private lazy var descriptionLabel = createLabel(text: "Your request for a VAT refund is confirmed", color: hexStringToUIColor(hex: "#70777E"), size: 17, weight: .regular)
    private lazy var footerLabel = createLabel(text: "ƏDV geri al cabinet", color: hexStringToUIColor(hex: "#FAA61A"), size: 18, weight: .bold)
    
    //MARK: - Parent delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setUpUI() {
        backgroundColor = Colors.backgroundColor
        
        addSubview(successIconView)
        successIconView.addSubview(successIcon)
        addSubview(wellDoneLabel)
        addSubview(descriptionLabel)
        addSubview(footerLabel)
        
        successIconView.snp.makeConstraints { make in
            make.height.width.equalTo(136)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        successIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17)
            make.bottom.equalToSuperview().offset(-26)
        }
        
        wellDoneLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(successIconView.snp.bottom).offset(38)
        }
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(wellDoneLabel.snp.bottom).offset(18)
            make.left.equalToSuperview().offset(34)
            make.right.equalToSuperview().offset(-34)
        }
        
        footerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(14)
        }
    }
}
