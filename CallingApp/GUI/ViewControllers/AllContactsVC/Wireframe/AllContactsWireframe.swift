//
//  AllContactsWireframe.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsWireframe: AllContactsWireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: AllContactsView!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = AllContactsView.instantiate(fromAppStoryboard: .AllContacts)
        let interactor = AllContactsInteractor()
        let presenter = AllContactsPresenter(interface: view, interactor: interactor, wireframe: self)
        view.presenter = presenter
        interactor.presenter = presenter
        rootWireframe = RootWireframe()
    }
}

// MARK: AllContactsWireframeProtocol
extension AllContactsWireframe {
    func presentAllContactsModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func presentAllContactsModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func presentAllContactsModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
    
    func showContactDetail(_ forContact: ContactModel) {
        let contactDetail = ContactDetailWireframe()
        contactDetail.showContactDetailModule(fromNavView: self.view.navigationController!, contact: forContact)
    }
}
