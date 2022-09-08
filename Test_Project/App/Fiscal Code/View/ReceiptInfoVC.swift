//
//  ReceiptInfoVC.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import UIKit

class ReceiptInfoVC: UIViewController {
    
    //MARK: - Variables
    private var items = [ReceiptInfo]()
    
    //MARK: UI Elements
    private lazy var mainTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = Colors.backgroundColor
        view.isScrollEnabled = false
        view.delegate = self
        view.dataSource = self
        view.register(ReceiptInfoTableViewCell.self, forCellReuseIdentifier: "\(ReceiptInfoTableViewCell.self)")
        return view
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = hexStringToUIColor(hex: "#FAA61A")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        button.isEnabled = true
//        button.layer.opacity = 0.5
        return button
    }()

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        configureTableView()
        configureConstraints()
    }
    
    //MARK: - Functions
    private func configureConstraints() {
        view.addSubview(mainTableView)
        view.addSubview(continueButton)
        
        let top = view.safeAreaLayoutGuide.snp.top
        let left = view.safeAreaLayoutGuide.snp.left
        let right = view.safeAreaLayoutGuide.snp.right
        
        mainTableView.snp.makeConstraints { make in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.height.equalTo(423)
            make.top.equalTo(top).offset(10)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(mainTableView.snp.bottom).offset(16)
            make.left.equalTo(left).offset(16)
            make.right.equalTo(right).offset(-16)
            make.height.equalTo(56)
        }
    }
    
    private func configureTableView() {
        items = [
            ReceiptInfo(title: "Name", info: "Chris Anderson"),
            ReceiptInfo(title: "Number", info: "+994558144191"),
            ReceiptInfo(title: "Fiscal ID", info: "7Skjq127saa"),
            ReceiptInfo(title: "Store", info: "Restoran Deniz"),
            ReceiptInfo(title: "Purchase amount", info: "10.85 AZN"),
            ReceiptInfo(title: "User", info: "0.25 AZN")
        ]
    }
    
    @objc
    private func didTapContinue() {
        let successVC = SuccessVC()
        successVC.title = "ƏDV geri al"
        navigationController?.pushViewController(successVC, animated: true)
    }
}

//MARK: - Extension ReceiptInfoVC
extension ReceiptInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ReceiptInfoTableViewCell.self)", for: indexPath) as! ReceiptInfoTableViewCell
        let item = items[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70.5
    }
}
