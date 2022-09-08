//
//  ActionView.swift
//  Test_Project
//
//  Created by Ismayil Ismayilov on 07.09.22.
//

import UIKit

class ActionsView: UIView {
    
    //MARK: - Variables
    let scannerVC = ScannerVC()
    var delegate: ActionsViewProtocol?
    var options = [ActionsOption]()
    
    //MARK: - UI Elements
    private lazy var actionsTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = backgroundColor
        view.delegate = self
        view.dataSource = self
        view.register(ActionsTableViewCell.self, forCellReuseIdentifier: "\(ActionsTableViewCell.self)")
        return view
    }()
    
    //MARK: - Parent Delegate
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Functions
    private func setupUI() {
        backgroundColor = Colors.backgroundColor
        
        addSubview(actionsTableView)
        
        actionsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        options = [
            ActionsOption(title: "Scan QR", icon: UIImageView(image: UIImage(named: "qr_scanner")), handler: {
                self.delegate?.didTapScanner()
            }),
            ActionsOption(title: "Enter fisscal ID", icon: UIImageView(image: UIImage(named: "fiskal")), handler: {
                self.delegate?.didTapFiskal()
            }),
            ActionsOption(title: "Pay", icon: UIImageView(image: UIImage(named: "wallet_pay")), handler: {
                print("Wallet tapped")
            }),
            ActionsOption(title: "ƏDV geri al information", icon: UIImageView(image: UIImage(named: "info")), handler: {
                print("ƏDV geri al information tapped")
            }),
            ActionsOption(title: "Log out from ƏDV geri al", icon: UIImageView(image: UIImage(named: "out")), handler: {
                print("Log out from ƏDV geri al tapped")
            })
        ]
    }
}

//MARK: - Extension ActionsView
extension ActionsView: UITableViewDelegate,
                        UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ActionsTableViewCell.self)", for: indexPath) as! ActionsTableViewCell
        cell.selectionStyle = .none
        let item = options[indexPath.row]
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        options[indexPath.row].handler()
        
    }
}
