//
//  ActionsTableViewCell.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import Foundation
import UIKit

class ActionsTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    private lazy var titleLabel = createLabel(text: "", color: hexStringToUIColor(hex: "#231F20"), size: 18, weight: .regular)
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        return image
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
        contentView.addSubview(iconView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
        
        iconView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func configureCell(item: ActionsOption) {
        titleLabel.text = item.title
        iconView.image = item.icon.image
    }
}

