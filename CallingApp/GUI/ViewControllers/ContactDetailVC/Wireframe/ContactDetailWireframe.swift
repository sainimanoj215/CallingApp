//
//  ContactDetailWireframe.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContactDetailWireframe: ContactDetailWireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: ContactDetailView!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = ContactDetailView.instantiate(fromAppStoryboard: .ContactDetail)
        let interactor = ContactDetailInteractor()
        let presenter = ContactDetailPresenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: ContactDetailWireframeProtocol
extension ContactDetailWireframe {
    func presentContactDetailModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func presentContactDetailModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func presentContactDetailModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
    
    func showContactDetailModule(fromNavView view: UINavigationController, contact: ContactModel, addNewContact: Bool) {
        // Push Code
        self.view.contact = contact
        self.view.addNewContact = addNewContact
        self.presentContactDetailModule(fromNavView: view)
    }
}
