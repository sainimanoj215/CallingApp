//
//  ContaclDetailProtocols.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol ContaclDetailViewProtocol: class {
    var presenter: ContaclDetailPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol ContaclDetailWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentContaclDetailModule(fromWindow window: UIWindow)
    func presentContaclDetailModule(fromNavView view: UINavigationController)
    func presentContaclDetailModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    
}

//MARK: Presenter -
protocol ContaclDetailPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */

}

//MARK: Interactor -
protocol ContaclDetailInteractorInputProtocol: class {
    
    var presenter: ContaclDetailPresenterProtocol?  { get set }
    var APIDataManager: ContaclDetailAPIDataManagerInputProtocol? { get set }
    var localDataManager: ContaclDetailLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
}
protocol ContaclDetailInteractorOutputProtocol: class {
    
    var presenter: ContaclDetailPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol ContaclDetailDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol ContaclDetailAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
}

//MARK: Local -
protocol ContaclDetailLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
