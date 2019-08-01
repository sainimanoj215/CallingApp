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
        if self.addNewContact || self.editContact{
            return 5
        }
        return 3
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            if self.addNewContact || self.editContact {
//                return 170
//            }
//            return 281
//        }
//        return 60
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && (self.editContact || self.addNewContact){
            let cell = tableView.dequeueReusableCell(withIdentifier: kAddProfilePicTableViewCell, for: indexPath) as! AddProfilePicTableViewCell
            cell.selectionStyle = .none
            if self.addNewContact {
                cell.cameraBtn.addTarget(self, action: #selector(didTapCamera(sender:)), for: .touchUpInside)
            }
            else {
                ImageDownloadManager.shared.downloadImage(imageUrl: contact.getProfilePicUrl(), indexPath: indexPath) { (image, url, indexPath, error) in
                    if let profilePic = image {
                        DispatchQueue.main.async {
                            cell.profileImgVIew.image = profilePic
                        }
                    }
                }
                cell.cameraBtn.addTarget(self, action: #selector(didTapCamera(sender:)), for: .touchUpInside)
            }
            return cell
        }
        else if indexPath.row == 0 && (!self.editContact || !self.addNewContact) {
            let cell = tableView.dequeueReusableCell(withIdentifier: kProfileTableViewCell, for: indexPath) as! ProfileTableViewCell
            cell.selectionStyle = .none
            cell.nameLbl.text = self.contact.getFullName()
            cell.favBtn.isSelected = contact.favorite ?? false
            ImageDownloadManager.shared.downloadImage(imageUrl: contact.getProfilePicUrl(), indexPath: indexPath) { (image, url, indexPath, error) in
                if let profilePic = image {
                    DispatchQueue.main.async {
                        cell.profileImgVIew.image = profilePic
                    }
                }
            }
            if contact.phoneNumber ?? "" == "" {
                cell.messageBtn.isUserInteractionEnabled = false
                cell.callBtn.isUserInteractionEnabled = false
            }
            else {
                cell.messageBtn.isUserInteractionEnabled = true
                cell.callBtn.isUserInteractionEnabled = true
            }
            if contact.email ?? "" == "" {
                cell.emailBtn.isUserInteractionEnabled = false
            }
            else {
                cell.emailBtn.isUserInteractionEnabled = true
            }
            cell.messageBtn.addTarget(self, action: #selector(didTapMessage(sender:)), for: .touchUpInside)
            cell.callBtn.addTarget(self, action: #selector(didTapCall(sender:)), for: .touchUpInside)
            cell.emailBtn.addTarget(self, action: #selector(didTapEmail(sender:)), for: .touchUpInside)
            cell.favBtn.addTarget(self, action: #selector(didTapFav(sender:)), for: .touchUpInside)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: kContactInfoTableViewCell, for: indexPath) as! ContactInfoTableViewCell
            cell.selectionStyle = .none
            if self.addNewContact || self.editContact {
                cell.makeCellEditable(editable: true)
                cell.textField.tag = (indexPath.row - 1)
                cell.textField.delegate = self
                if indexPath.row == 1 {
                    cell.titleLbl.text = "First Name"
                    cell.textField.placeholder = "Enter First Name"
                    cell.textField.text = contact.firstName ?? ""
                    cell.textField.keyboardType = .default
                }
                else if indexPath.row == 2 {
                    cell.titleLbl.text = "Last Name"
                    cell.textField.placeholder = "Enter Last Name"
                    cell.textField.text = contact.lastName ?? ""
                    cell.textField.keyboardType = .default
                }
                else if indexPath.row == 3 {
                    cell.titleLbl.text = "mobile"
                    cell.textField.placeholder = "Enter Mobile"
                    cell.textField.text = contact.phoneNumber ?? ""
                    cell.textField.keyboardType = .phonePad
                }
                else {
                    cell.titleLbl.text = "email"
                    cell.textField.placeholder = "Enter Email"
                    cell.textField.text = contact.email ?? ""
                    cell.textField.keyboardType = .emailAddress
                }
            }
            else {
                cell.makeCellEditable(editable: false)
                if indexPath.row == 1 {
                    cell.titleLbl.text = "mobile"
                    cell.textField.placeholder = "Enter Mobile"
                    cell.textField.text = contact.phoneNumber ?? ""
                }
                else {
                    cell.titleLbl.text = "email"
                    cell.textField.placeholder = "Enter Email"
                    cell.textField.text = contact.email ?? ""
                }
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
