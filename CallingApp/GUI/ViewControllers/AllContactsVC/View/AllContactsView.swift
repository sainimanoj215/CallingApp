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

    @IBOutlet weak var contactsTableView: UITableView!
    @IBOutlet weak var alphaCollectionView: UICollectionView!
    
    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
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
}
