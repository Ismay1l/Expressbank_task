//
//  MainModel.swift
//  Test_Project
//
//  Created by USER11 on 9/8/22.
//

import Foundation
import UIKit

struct ActionsOption {
    let title: String
    let icon: UIImageView
    let handler: () -> Void
}

struct HistoryOption {
    let phoneNumber: String
    let cardNumber: String
    let amount: String
}
