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
