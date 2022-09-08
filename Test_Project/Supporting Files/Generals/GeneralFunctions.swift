//
//  GeneralFunctions.swift
//  Test_Project
//
//  Created by USER11 on 9/7/22.
//

import UIKit

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

struct Colors {
    static let backgroundColor = hexStringToUIColor(hex: "E5E5E5")
}

func createLabel(text: String, color: UIColor, size: CGFloat, weight: UIFont.Weight) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = color
    label.font = .systemFont(ofSize: size, weight: weight)
    return label
}
