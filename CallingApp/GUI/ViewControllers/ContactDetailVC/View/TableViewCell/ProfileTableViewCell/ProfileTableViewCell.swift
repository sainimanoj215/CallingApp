//
//  ProfileTableViewCell.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/27/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit
import Foundation

let kProfileTableViewCell = "ProfileTableViewCell"
class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImgVIew: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    var gradientLayer : CAGradientLayer!
    var gradientColors : [UIColor] = [UIColor.white.withAlphaComponent(0.5), UIColor.colorBrandBlue.withAlphaComponent(0.5)]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImgVIew.layer.cornerRadius = self.profileImgVIew.bounds.height/2
        self.profileImgVIew.layer.borderWidth = 3
        self.profileImgVIew.layer.borderColor = UIColor.white.cgColor
        self.profileImgVIew.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if gradientLayer == nil {
            setGradient(withColors: gradientColors)
        }
    }
}

extension ProfileTableViewCell {
    func setGradient(withColors colors : [UIColor], withDirection direction : CAGradientLayer.GradientDirection) {
        if gradientLayer != nil {
            gradientLayer.removeFromSuperlayer()
        }
        gradientColors = colors
        gradientLayer = CAGradientLayer.addGradient(withGradientDirection: direction, withGradientColors: colors, withParentBounds: self.bounds)
        self.containerView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradient(withColors colors : [UIColor]) {
        setGradient(withColors: colors, withDirection: CAGradientLayer.GradientDirection.topToBottom)
    }
}
