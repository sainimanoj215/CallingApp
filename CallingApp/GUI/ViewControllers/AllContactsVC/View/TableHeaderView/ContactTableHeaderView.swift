//
//  ContactTableHeaderView.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import UIKit

class ContactTableHeaderView: UIView {

    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func instanceFromNib() -> ContactTableHeaderView {
        return UINib(nibName: "ContactTableHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ContactTableHeaderView
    }

}
