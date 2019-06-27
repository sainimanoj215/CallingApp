//
//  AllContactsView+TableView.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import Foundation
import UIKit

// MARK: UITableViewDataSource
extension AllContactsView : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.allContactsKeyArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contact = self.allContactsKeyArray[section]
        return self.allContactsArray[contact]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kContactTableViewCell, for: indexPath) as! ContactTableViewCell
        cell.selectionStyle = .none
        let index = self.allContactsKeyArray[indexPath.section]
        let contact = self.allContactsArray[index]![indexPath.row]
        cell.contactNameLbl.text = contact.firstName ?? ""
        cell.favBtn.isHidden = !(contact.favorite ?? false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let index = self.allContactsKeyArray[indexPath.section]
        let contact = self.allContactsArray[index]![indexPath.row]
        (cell as! ContactTableViewCell).contactImageView.image = #imageLiteral(resourceName: "placeholder_photo")
        ImageDownloadManager.shared.downloadImage(imageUrl: (baseURL() + (contact.profilePic ?? "")), indexPath: indexPath) { (image, url, indexPathh, error) in
            if let indexPathNew = indexPathh, indexPathNew == indexPath {
                DispatchQueue.main.async {
                    (cell as! ContactTableViewCell).contactImageView.image = image
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let index = self.allContactsKeyArray[indexPath.section]
        let contact = self.allContactsArray[index]![indexPath.row]
        ImageDownloadManager.shared.slowDownImageDownloadTaskfor(imageUrl: (baseURL() + (contact.profilePic ?? "")))
    }
}

// MARK: UICollectionViewDelegate
extension AllContactsView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ContactTableHeaderView.instanceFromNib()
        headerView.titleLbl.text = self.allContactsKeyArray[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = self.allContactsKeyArray[indexPath.section]
        let contact = self.allContactsArray[index]![indexPath.row]
        self.presenter?.showContactDetail(contact)
    }
}
