//
//  HistoryTableViewCell.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import Foundation
import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    private lazy var cardImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "card_holder"))
        return image
    }()
    
    private lazy var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = hexStringToUIColor(hex: "#A9ABAC")
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private lazy var phoneNumberLabel = createLabel(text: "", color: hexStringToUIColor(hex: "#231F20"), size: 16, weight: .regular)
    private lazy var cardNumber = createLabel(text: "", color: hexStringToUIColor(hex: "#A9ABAC"), size: 14, weight: .regular)
    private lazy var amountLabel = createLabel(text: "", color: hexStringToUIColor(hex: "#A9ABAC"), size: 14, weight: .regular)
    
    //MARK: - Parent Delegate
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(cardImage)
        contentView.addSubview(dotView)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(cardNumber)
        contentView.addSubview(amountLabel)
        
        cardImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(23)
            make.height.width.equalTo(48)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.left.equalTo(cardImage.snp.right).offset(20)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-22)
            make.right.equalToSuperview().offset(-18)
        }
        
        dotView.snp.makeConstraints { make in
            make.centerY.equalTo(amountLabel.snp.centerY)
            make.width.height.equalTo(3)
            make.right.equalTo(amountLabel.snp.left).offset(-8)
        }
        
        cardNumber.snp.makeConstraints { make in
            make.left.equalTo(cardImage.snp.right).offset(20)
            make.right.equalTo(dotView.snp.left).offset(-1)
            make.bottom.equalToSuperview().offset(-22)
        }
    }
    
    func configureCell(item: HistoryOption) {
        phoneNumberLabel.text = item.phoneNumber
        cardNumber.text = item.cardNumber
        amountLabel.text = item.amount
    }
}
