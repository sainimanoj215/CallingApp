//
//  AllContactsProtocols.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol AllContactsViewProtocol: class {
    var presenter: AllContactsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol AllContactsWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentAllContactsModule(fromWindow window: UIWindow)
    func presentAllContactsModule(fromNavView view: UINavigationController)
    func presentAllContactsModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func showContactDetail(_ forContact: ContactModel)
}

//MARK: Presenter -
protocol AllContactsPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */
    func getAllContacts(completion:@escaping(_ results: [String:[ContactModel]]) -> ())
    func showContactDetail(_ forContact: ContactModel)
}

//MARK: Interactor -
protocol AllContactsInteractorInputProtocol: class {
    
    var presenter: AllContactsPresenterProtocol?  { get set }
    var APIDataManager: AllContactsAPIDataManagerInputProtocol? { get set }
    var localDataManager: AllContactsLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getAllContacts(completion:@escaping(_ results: [String:[ContactModel]]) -> ())
}
protocol AllContactsInteractorOutputProtocol: class {
    
    var presenter: AllContactsPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol AllContactsDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol AllContactsAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
    
    func getAllContacts(completion:@escaping(_ results: [ContactModel]) -> ())
}

//MARK: Local -
protocol AllContactsLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
