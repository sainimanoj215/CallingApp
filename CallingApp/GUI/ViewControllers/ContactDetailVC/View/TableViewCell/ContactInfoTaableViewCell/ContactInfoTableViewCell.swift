//
//  ContactInfoTableViewCell.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/27/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

let kContactInfoTableViewCell = "ContactInfoTableViewCell"
class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lcWidthTitleLbl: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeCellEditable(editable: Bool) {
        self.textField.isUserInteractionEnabled = editable
        self.lcWidthTitleLbl.constant = editable ? 80 : 50
    }
}
