//
//  AllContactsView.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsView: UIViewController, AllContactsViewProtocol {

	var presenter: AllContactsPresenterProtocol?
    var allContactsArray : [String : [ContactModel]]!
    var allContactsKeyArray : [String]! = []

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var contactsTableView: UITableView!{
        didSet {
            contactsTableView?.register(UINib(nibName: kContactTableViewCell, bundle: nil), forCellReuseIdentifier: kContactTableViewCell)
        }
    }
    @IBOutlet weak var alphaCollectionView: UICollectionView! {
        didSet {
            alphaCollectionView?.register(UINib(nibName: kCharcterCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: kCharcterCollectionViewCell)
        }
    }
    
    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllContacts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func fetchAllContacts() {
        self.loader.startAnimating()
        self.presenter?.getAllContacts(completion: { (contacts) in
            self.allContactsArray = contacts
            var tmpArr : [String]! = []
            var otherKey = false
            for (key, _) in contacts {
                if key == "#" {
                    otherKey = true
                }
                else {
                    tmpArr.append(key)
                }
            }
            self.allContactsKeyArray = tmpArr.sorted(by: {$0 < $1})
            if otherKey {
                self.allContactsKeyArray.append("#")
            }
            self.contactsTableView.reloadData()
            self.loader.stopAnimating()
        })
    }
    
    
    @IBAction func didTapAddNewContact(_ sender: Any) {
        self.presenter?.showContactDetail(ContactModel(), addNewContact: true)
    }
}
