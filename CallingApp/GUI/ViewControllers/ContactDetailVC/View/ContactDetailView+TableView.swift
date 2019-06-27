//
//  ContactDetailView+TableView.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/27/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import Foundation
import UIKit

// MARK: UITableViewDataSource
extension ContactDetailView : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: kProfileTableViewCell, for: indexPath) as! ProfileTableViewCell
            cell.selectionStyle = .none
            cell.nameLbl.text = self.contact.getFullName()
            cell.favBtn.isSelected = contact.favorite ?? false
            ImageDownloadManager.shared.downloadImage(imageUrl: (baseURL() + (contact.profilePic ?? "")), indexPath: indexPath) { (image, url, indexPath, error) in
                if let profilePic = image {
                    DispatchQueue.main.async {
                        cell.profileImgVIew.image = profilePic
                    }
                }
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: kContactInfoTableViewCell, for: indexPath) as! ContactInfoTableViewCell
            cell.selectionStyle = .none
            cell.makeCellEditable(editable: false)
            if indexPath.row == 1 {
                cell.titleLbl.text = "mobile"
                cell.textField.text = contact.phoneNumber ?? ""
            }
            else {
                cell.titleLbl.text = "email"
                cell.textField.text = contact.email ?? ""
            }
            return cell
        }
    }
}

// MARK: UICollectionViewDelegate
extension ContactDetailView : UITableViewDelegate {   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
