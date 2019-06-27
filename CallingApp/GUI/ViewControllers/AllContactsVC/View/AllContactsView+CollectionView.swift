//
//  AllContactsView+CollectionView.swift
//  CallingApp
//
//  Created by Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import Foundation
import UIKit

// MARK: UICollectionViewDataSource
extension AllContactsView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCharcterCollectionViewCell, for: indexPath) as! CharcterCollectionViewCell
        cell.titleLbl.text = letterArray[indexPath.row]
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension AllContactsView : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.contactsTableView.scrollToRow(at: IndexPath(row: NSNotFound, section: indexPath.row), at: .top, animated: true)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension AllContactsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 17)
    }
}
