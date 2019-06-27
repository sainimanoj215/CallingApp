//
//  ContactTableViewCell.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

let kContactTableViewCell = "ContactTableViewCell"
class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLbl: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var lineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contactImageView.layer.cornerRadius = self.contactImageView.bounds.height/2
        self.contactImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
