//
//  AddProfilePicTableViewCell.swift
//  CallingApp
//
//  Created by Manoj Saini on 7/30/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

let kAddProfilePicTableViewCell = "AddProfilePicTableViewCell"
class AddProfilePicTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImgVIew: UIImageView!
    @IBOutlet weak var cameraBtn: UIButton!
    var gradientLayer : CAGradientLayer!
    var gradientColors : [UIColor] = [UIColor.white.withAlphaComponent(0.5), UIColor.colorBrandBlue.withAlphaComponent(0.5)]

    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImgVIew.layer.cornerRadius = self.profileImgVIew.bounds.height/2
        self.profileImgVIew.layer.borderWidth = 3
        self.profileImgVIew.layer.borderColor = UIColor.white.cgColor
        self.profileImgVIew.layer.masksToBounds = true
        // Initialization code
    }

    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setGradient(withColors: gradientColors)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension AddProfilePicTableViewCell {
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
