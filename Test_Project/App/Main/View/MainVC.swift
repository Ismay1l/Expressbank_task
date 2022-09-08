//
//  MainVC.swift
//  Test_Project
//
//  Created by USER11 on 9/7/22.
//

import UIKit
import Segmentio

class MainVC: UIViewController {
    
    //MARK: - Variables
    var segmentController = Segmentio()
    let actionsView = ActionsView()
    let historyView = HistoryView()
    
    //MARK: - UI Elements
    private lazy var cardImageView = CardView()
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        configureConstraints()
        fillContainer(subView: actionsView)
        segmentSetUp()
        setUpNavigationItem()
        actionsView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentDidChanged(segmentIndex: segmentController.selectedSegmentioIndex)
        segmentController.selectedSegmentioIndex = 0
    }
    
    //MARK: - Functions
    private func configureConstraints() {
        view.addSubview(cardImageView)
        view.addSubview(segmentController)
        view.addSubview(containerView)
        
        let top = view.safeAreaLayoutGuide.snp.top
        let left = view.safeAreaLayoutGuide.snp.left
        let right = view.safeAreaLayoutGuide.snp.right
        let bottom = view.safeAreaLayoutGuide.snp.bottom
        
        cardImageView.snp.makeConstraints { make in
            make.top.equalTo(top).offset(23)
            make.left.equalTo(left).offset(37.5)
            make.right.equalTo(right).offset(-37.5)
            make.height.equalTo(190)
        }
        
        segmentController.snp.makeConstraints { make in
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.top.equalTo(cardImageView.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(segmentController.snp.bottom)
            make.left.equalTo(left)
            make.right.equalTo(right)
            make.bottom.equalTo(bottom)
        }
    }
    
    private func segmentSetUp() {
        segmentController.valueDidChange = { segmentio, segmentionIndex in
            self.segmentDidChanged(segmentIndex: segmentionIndex)
        }
        
        let states = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 20, weight: .medium),
                titleTextColor: .darkGray
            ),
            selectedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 20, weight: .bold),
                titleTextColor: hexStringToUIColor(hex: "#000000")
            ),
            highlightedState: SegmentioState(
                backgroundColor: .clear,
                titleFont: UIFont.systemFont(ofSize: 20),
                titleTextColor: UIColor.clear
            )
        )
        
        var content = [SegmentioItem]()
        
        let item1 = SegmentioItem(title: "Actions", image: nil)
        let item2 = SegmentioItem(title: "History", image: nil)
        
        content.append(item1)
        content.append(item2)
        
        let horizontalSeparatorOptions = SegmentioHorizontalSeparatorOptions( type: SegmentioHorizontalSeparatorType.bottom, height: 0, color: .clear)
        
        let indicatorOptions = SegmentioIndicatorOptions(type: .bottom,
                                                         ratio: 1,
                                                         height: 2,
                                                         color: hexStringToUIColor(hex: "#FFB500"))
        
        let options = SegmentioOptions(backgroundColor: .clear,
                                       segmentPosition: SegmentioPosition.dynamic,
                                       scrollEnabled: false,
                                       indicatorOptions: indicatorOptions,
                                       horizontalSeparatorOptions: horizontalSeparatorOptions,
                                       verticalSeparatorOptions: nil,
                                       imageContentMode: .bottom,
                                       labelTextAlignment: .center,
                                       labelTextNumberOfLines: 1,
                                       segmentStates: states,
                                       animationDuration: 0)
        
        segmentController.setup(content: content, style: SegmentioStyle.onlyLabel, options: options)
        segmentController.selectedSegmentioIndex = 0
    }
    
    private func segmentDidChanged(segmentIndex: Int) {
        switch segmentIndex {
        case 0:
            switchSegmentView(with: actionsView)
        case 1:
            switchSegmentView(with: historyView)
        default:
            break
        }
    }
    
    private func switchSegmentView(with view: UIView) {
        fillContainer(subView: view)
    }
    
    private func fillContainer ( subView: UIView) {
        
        containerView.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        
        containerView.addSubview(subView)
        
        subView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func setUpNavigationItem() {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = hexStringToUIColor(hex: "#231F20")
        self.navigationItem.backBarButtonItem = item
    }
}

//MARK: - Extension MainVC
extension MainVC: ActionsViewProtocol {
    func didTapFiskal() {
        let fiskalVC = FiscalVC()
        fiskalVC.title = "Enter fiscal ID"
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = hexStringToUIColor(hex: "#231F20")
        fiskalVC.navigationItem.backBarButtonItem = item
        navigationController?.pushViewController(fiskalVC, animated: true)
    }
    
    func didTapScanner() {
        let scannerVC = ScannerVC()
        scannerVC.title = "Scan QR"
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.tintColor = hexStringToUIColor(hex: "#231F20")
        scannerVC.navigationItem.backBarButtonItem = item
        navigationController?.pushViewController(scannerVC, animated: true)
    }
}


