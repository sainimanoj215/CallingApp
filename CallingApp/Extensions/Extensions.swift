//
//  Extensions.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/27/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import Foundation
import UIKit

extension CAGradientLayer {
    enum GradientDirection {
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
        case topLeftToBottomRight
        case bottomLeftToTopRight
    }
    
    class func addGradient(withGradientDirection gradientDirection : GradientDirection, withGradientColors gradientColors : [UIColor], withParentBounds parentBounds : CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        if gradientDirection == .leftToRight {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }else if gradientDirection == .rightToLeft {
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        }else if gradientDirection == .topToBottom {
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }else if gradientDirection == .bottomToTop {
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }else if gradientDirection == .topLeftToBottomRight {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }else if gradientDirection == .bottomLeftToTopRight {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }
        gradientLayer.colors = []
        gradientLayer.locations = []
        for color in gradientColors.enumerated() {
            gradientLayer.colors?.append(color.element.cgColor)
            gradientLayer.locations?.append(NSNumber(value: Double(color.offset) / Double(gradientColors.count - 1)))
        }
        gradientLayer.frame = parentBounds
        return gradientLayer
        
    }
}

// MARK:- STRINGS EXTENSION
public extension String {
    
    func isEmptyString() -> Bool {
        if self.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            return true
        }
        return false
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        if let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx) as NSPredicate? {
            return emailTest.evaluate(with: self)
        }
        return false
    }
    
    func isValidMobile() -> Bool {
        let phoneRegEx = "^[0-9]{6,15}"
        if let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx) as NSPredicate? {
            return phoneTest.evaluate(with: self)
        }
        return false
    }
}
