//
//  ContactDetailInteractor.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContactDetailInteractor: ContactDetailInteractorInputProtocol,
    ContactDetailInteractorOutputProtocol{

    var presenter: ContactDetailPresenterProtocol?
    var APIDataManager: ContactDetailAPIDataManagerInputProtocol?
    var localDataManager: ContactDetailLocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = ContactDetailAPIDataManager()
        localDataManager = ContactDetailLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ()){
        APIDataManager?.getContactInfo(forContact: forContact, completion: { (contact) in
            completion(contact)
        })
    }
    
    func addToFavorite(contact: ContactModel){
        APIDataManager?.addToFavorite(contact: contact)
    }
    
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        APIDataManager?.createContact(contactParam: contactParam, completion: completion)
    }
    
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        APIDataManager?.editContact(contactId: contactId, param: param, completion: completion)
    }
}
