//
//  ReceiptInfoTableViewCell.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import Foundation
import UIKit

class ReceiptInfoTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = hexStringToUIColor(hex: "#5F6369")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = hexStringToUIColor(hex: "#474C54")
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(16.3)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16.3)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    func configureCell(item: ReceiptInfo) {
        titleLabel.text = item.title
        infoLabel.text = item.info
    }
}
