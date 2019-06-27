//
//  UIColorExtension.swift
//  Roundaroo
//
//  Created by Nicholas LoGioco on 2/25/18.
//  Copyright © 2018 nlogioco. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @objc static let color_DD513F = UIColor(hex: "DD513F")
    @objc static let color_FC5F6B = UIColor(hex: "FC5F6B")
    @objc static let color_EF5424 = UIColor(hex: "EF5424")
    @objc static let color_EB5364 = UIColor(hex: "EB5364")
    @objc static let color_E2E8ED = UIColor(hex: "E2E8ED")
    @objc static let color_60C3FF = UIColor(hex: "60C3FF")
    @objc static let color_5574F7 = UIColor(hex: "5574F7")
    @objc static let color_DCE9FF = UIColor(hex: "DCE9FF")
    @objc static let color_5887F9 = UIColor(hex: "5887F9")
    @objc static let color_2B2F3B = UIColor(hex: "2B2F3B")
    @objc static let color_4C5264 = UIColor(hex: "4C5264")
    @objc static let color_EC5625 = UIColor(hex: "EC5625")
    @objc static let color_BCC5D3 = UIColor(hex: "BCC5D3")

    @objc static let colorPrimary = colorBrandOrange
    @objc static let colorPrimaryDark = colorBrandOrange
    @objc static let colorAccent = colorBrandGray
    
    @objc static let colorSecondary = colorBrandLightBlue
    
    @objc static let colorBrandOrange = UIColor(hex: "EF5424")
    @objc static let colorBrandLightGray = UIColor(hex: "D5DCE3")
    @objc static let colorBrandGray = UIColor(hex: "BCC5D3")
    @objc static let textColorError = UIColor(hex: "fdd835")
    @objc static let colorBrandDarkGray = UIColor(hex: "3C435D")
    @objc static let colorBrandRed = UIColor(hex: "EB5364")
    @objc static let colorBrandGreen = UIColor(hex: "34DB4F")
    @objc static let colorBrandDarkBlue = UIColor(hex: "5574F7")
    @objc static let colorBrandBlue = UIColor(hex: "60C3FF")
    @objc static let colorBrandLightBlue = UIColor(hex: "CCECFF")
    
    @objc static let colorBrandGrayTone7 = UIColor(hex: "252929")
    @objc static let colorTransparent = UIColor(hex: "66000000")
    @objc static let colorBrandGrayTone6 = UIColor(hex: "505959")
    @objc static let colorBrandGrayTone5 = UIColor(hex: "737F80")
    @objc static let colorBrandGrayTone4 = UIColor(hex: "B5C7C9")
    @objc static let colorBrandGrayTone3 = UIColor(hex: "D7E2E2")
    @objc static let colorBrandGrayTone2 = UIColor(hex: "E7EDEE")
    @objc static let colorBrandGrayTone1 = UIColor(hex: "EFF4F4")
    
    @objc static let colorBrandGrayAllEventsCardsBg = UIColor(hex: "F2F6F8")
    @objc static let colorBrandGrayAllEventsCardsSeparator = UIColor(hex: "E2E8ED")
    
    @objc static let colorBrandWhite = UIColor(hex: "FFFFFF")
    @objc static let colorBrandOffWhite = UIColor(hex: "FAFAFA")
    
    @objc static func colorWithRGB(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    @objc convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

enum GradientColorStyle {
    case color_5887F9
    case color_FC5F6B
    case color_60C3FF
    
    func getCurrentColors() -> [UIColor] {
        switch self {
        case .color_5887F9:
            return [UIColor.color_5887F9, UIColor.color_5887F9]
        case .color_FC5F6B:
            return [UIColor.color_FC5F6B, UIColor.color_DD513F]
        case .color_60C3FF:
            return [UIColor.color_60C3FF, UIColor.color_60C3FF]
        }
    }
    
    mutating func getNextColors() -> [UIColor] {
        switch self {
        case .color_5887F9:
            self = .color_FC5F6B
            return [UIColor.color_FC5F6B, UIColor.color_DD513F]
        case .color_FC5F6B:
            self = .color_60C3FF
            return [UIColor.color_60C3FF, UIColor.color_60C3FF]
        case .color_60C3FF:
            self = .color_5887F9
            return [UIColor.color_5887F9, UIColor.color_5887F9]
        }
    }
}
