//
//  RootWireframe.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit

class RootWireframe {
    
    let kAppDelgateObject = UIApplication.shared.delegate as! AppDelegate
    /// Function to initalize a view controller as Root view controller
    ///
    /// - Parameters:
    ///   - viewController: UIViewController as rootViewController
    ///   - inWindow: UIWindow as app current window
    
    func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
        var navigationController : UINavigationController!
        navigationController.viewControllers = [viewController]
        inWindow.rootViewController = navigationController
        inWindow.makeKeyAndVisible()
    }
    
    /// Function to create a UINavigationController
    ///
    /// - Returns: UINavigationController as the navigationController
    private func getNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = false
        return navigationController
    }
    
    func showAllContactsVC() {
        let imageSearchVC = AllContactsWireframe()
        imageSearchVC.presentAllContactsModule(fromWindow: kAppDelgateObject.window!)
    }
}
