//
//  FiscalVC.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import UIKit

class FiscalVC: UIViewController {
    
    //MARK: - UI Elements
    private lazy var fiscalTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var fiscalIDLabel = createLabel(text: "Fiscal ID", color: hexStringToUIColor(hex: "#5F6369"), size: 14, weight: .regular)
    
    private lazy var fiscalTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "16 symbols"
        field.textColor = hexStringToUIColor(hex: "#474C54")
        field.backgroundColor = .white
        return field
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = hexStringToUIColor(hex: "#FAA61A")
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
        button.isEnabled = false
        button.layer.opacity = 0.5
        return button
    }()

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        configureConstraints()
        fiscalTextField.delegate = self
        
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    //MARK: - Functions
    private func configureConstraints() {
        view.addSubview(fiscalTextFieldView)
        fiscalTextFieldView.addSubview(fiscalIDLabel)
        fiscalTextFieldView.addSubview(fiscalTextField)
        view.addSubview(continueButton)
        
        let top = view.safeAreaLayoutGuide.snp.top
        let left = view.safeAreaLayoutGuide.snp.left
        let right = view.safeAreaLayoutGuide.snp.right
        
        fiscalTextFieldView.snp.makeConstraints { make in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.top.equalTo(top).offset(10)
            make.height.equalTo(75)
        }
        
        fiscalIDLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14.5)
            make.left.equalToSuperview().offset(16.3)
        }
        
        fiscalTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16.3)
            make.top.equalTo(fiscalIDLabel.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-16.3)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(fiscalTextFieldView.snp.bottom).offset(16)
            make.left.equalTo(left).offset(16)
            make.right.equalTo(right).offset(-16)
            make.height.equalTo(56)
        }
    }
    
    @objc
    private func didTapContinue() {
        let receiptInfoVC = ReceiptInfoVC()
        receiptInfoVC.title = "Reciept info"
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = hexStringToUIColor(hex: "#231F20")
        receiptInfoVC.navigationItem.backBarButtonItem = item
        navigationController?.pushViewController(receiptInfoVC, animated: true)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - Extension FiscalVC
extension FiscalVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if fiscalTextField.text?.count == 16 {
            continueButton.isEnabled = true
            continueButton.layer.opacity = 1
        } else {
            continueButton.isEnabled = false
            continueButton.layer.opacity = 0.5
        }
    }
}
