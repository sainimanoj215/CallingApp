//
//  UIStoryboard.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit


// MARK: - Add the cases as in enum Storyboard matching the FileName of Storyboard
extension Storyboard {
	
	var instance: UIStoryboard {
		return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
	}
	
	func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
		
		let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
		
		guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
			fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard")
		}
		
		return scene
	}
	
	func initialViewController() -> UIViewController? {
		return instance.instantiateInitialViewController()
	}
}
