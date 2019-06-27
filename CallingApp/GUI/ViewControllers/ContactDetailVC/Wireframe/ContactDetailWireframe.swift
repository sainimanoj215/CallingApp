//
//  ContaclDetailWireframe.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContaclDetailWireframe: ContaclDetailWireframeProtocol {
    
    var rootWireframe: RootWireframe?
    var view: ContaclDetailView!

    init() {
        // Change to get view from storyboard if not using progammatic UI
        self.view = ContaclDetailView.instantiate(fromAppStoryboard: .ContaclDetail)
        let interactor = ContaclDetailInteractor()
        let presenter = ContaclDetailPresenter(interface: view, interactor: interactor, wireframe: self)
        
        view.presenter = presenter
        interactor.presenter = presenter

    }
}

// MARK: ContaclDetailWireframeProtocol
extension ContaclDetailWireframe {
    func presentContaclDetailModule(fromNavView view: UINavigationController) {
        // Push Code
        view.pushViewController(self.view, animated: true)
    }
    func presentContaclDetailModule(fromView view: UIViewController) {
        // TODO: Present this module from another view
        // Your code goes here
    }
    // MARK: LoginWireframeProtocol
    func presentContaclDetailModule(fromWindow window: UIWindow) {
        self.rootWireframe?.showRootViewController(self.view, inWindow: window)
    }
    
    func showContaclDetailModule(fromNavView view: UINavigationController, contact: ContactModel) {
        // Push Code
        self.view.contact = contact
        self.presentContaclDetailModule(fromNavView: view)
    }
}
