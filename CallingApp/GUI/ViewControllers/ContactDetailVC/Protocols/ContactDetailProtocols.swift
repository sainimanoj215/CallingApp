//
//  ContactDetailProtocols.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit


//MARK: View -
protocol ContactDetailViewProtocol: class {
    var presenter: ContactDetailPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
}

//MARK: Wireframe -
protocol ContactDetailWireframeProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    func presentContactDetailModule(fromWindow window: UIWindow)
    func presentContactDetailModule(fromNavView view: UINavigationController)
    func presentContactDetailModule(fromView view: UIViewController)
    /**
     * Add here your methods for communication PRESENTER -> WIREFRAME
     */
    func showContactDetailModule(fromNavView view: UINavigationController, contact: ContactModel, addNewContact: Bool)
}

//MARK: Presenter -
protocol ContactDetailPresenterProtocol: class {
    /**
     * Add here your methods for communication VIEW -> PROTOCOL
     */
    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ())
    func addToFavorite(contact: ContactModel)
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
}

//MARK: Interactor -
protocol ContactDetailInteractorInputProtocol: class {
    
    var presenter: ContactDetailPresenterProtocol?  { get set }
    var APIDataManager: ContactDetailAPIDataManagerInputProtocol? { get set }
    var localDataManager: ContactDetailLocalDataManagerInputProtocol? { get set }
    
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ())
    func addToFavorite(contact: ContactModel)
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
}
protocol ContactDetailInteractorOutputProtocol: class {
    
    var presenter: ContactDetailPresenterProtocol?  { get set }
    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
}




//MARK: - DataManager -
protocol ContactDetailDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> DATAMANAGER
     */
    // Data fetch functions without knowing the source (API or Local)
}

//MARK: API -
protocol ContactDetailAPIDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
     */
    // Data fetch functions from server
    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ())
    func addToFavorite(contact: ContactModel)
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ())
}

//MARK: Local -
protocol ContactDetailLocalDataManagerInputProtocol: class {
    /**
     * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
     */
    // Data fetch functions from local database

}
