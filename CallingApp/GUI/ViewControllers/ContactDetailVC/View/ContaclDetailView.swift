//
//  ContactDetailView.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContactDetailView: UIViewController, ContactDetailViewProtocol {

	var presenter: ContactDetailPresenterProtocol?
    var contact : ContactModel!    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView?.register(UINib(nibName: kProfileTableViewCell, bundle: nil), forCellReuseIdentifier: kProfileTableViewCell)
            tableView?.register(UINib(nibName: kContactInfoTableViewCell, bundle: nil), forCellReuseIdentifier: kContactInfoTableViewCell)
            tableView.tableFooterView = UIView()
        }
    }
    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.getContactInfo()
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
    
    private func getContactInfo(){
        self.loader.startAnimating()
        self.presenter?.getContactInfo(forContact: "\(self.contact!.id ?? 0)", completion: { (contactInfo) in
            if contactInfo != nil {
                self.contact = contactInfo
            }
            self.tableView.reloadData()
            self.loader.stopAnimating()
        })
    }
}
