//
//  HistoryView.swift
//  Test_Project
//
//  Created by Ismayil Ismayilov on 07.09.22.
//

import UIKit

class HistoryView: UIView {
    
    //MARK: - Variables
    var options = [HistoryOption]()
    
    //MARK: - UI Elements
    private lazy var historyTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = backgroundColor
        view.delegate = self
        view.dataSource = self
        view.register(HistoryTableViewCell.self, forCellReuseIdentifier: "\(HistoryTableViewCell.self)")
        return view
    }()
    
    //MARK: - Parent Delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupUI()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {
        backgroundColor = Colors.backgroundColor
        addSubview(historyTableView)
        
        historyTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        options = [
            HistoryOption(phoneNumber: "994 55 814 41 91", cardNumber: "AZ12EX345563784124324535…", amount: "278 ₼"),
            HistoryOption(phoneNumber: "994 55 914 51 91", cardNumber: "AZ12EX345563433124324535…", amount: "173 ₼"),
            HistoryOption(phoneNumber: "994 55 819 61 91", cardNumber: "AZ12EX345563784124444535…", amount: "298 ₼"),
            HistoryOption(phoneNumber: "994 55 894 71 91", cardNumber: "AZ12EX444563784124324535…", amount: "145 ₼"),
            HistoryOption(phoneNumber: "994 55 819 81 91", cardNumber: "AZ12EX345563784124328885…", amount: "129 ₼")
        ]
    }
}

//MARK: - Extension HistoryView
extension HistoryView: UITableViewDelegate,
                        UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(HistoryTableViewCell.self)", for: indexPath) as! HistoryTableViewCell
        cell.selectionStyle = .none
        let item = options[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        88
    }
}
