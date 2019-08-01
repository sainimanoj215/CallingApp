//
//  ContactDetailPresenter.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContactDetailPresenter: ContactDetailPresenterProtocol {
    weak private var view: ContactDetailViewProtocol?
    private let interactor: ContactDetailInteractorInputProtocol
    private let wireframe: ContactDetailWireframeProtocol

    init(interface: ContactDetailView, interactor: ContactDetailInteractorInputProtocol, wireframe: ContactDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ()){
        interactor.getContactInfo(forContact: forContact) { (contactInfo) in
            completion(contactInfo)
        }
    }
    
    func addToFavorite(contact: ContactModel){
        self.interactor.addToFavorite(contact: contact)
    }
    
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        self.interactor.createContact(contactParam: contactParam, completion: completion)
    }
    
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        self.interactor.editContact(contactId: contactId, param: param, completion: completion)
    }
}
