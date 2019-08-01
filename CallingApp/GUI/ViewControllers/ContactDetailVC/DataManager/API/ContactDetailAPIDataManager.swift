//
//  ContactDetailAPIDataManager.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContactDetailAPIDataManager: ContactDetailAPIDataManagerInputProtocol {

    init() {}
    
    // Data fetch service methods goes here
    func getContactInfo(forContact: String, completion:@escaping(_ results: ContactModel?) -> ()){
        let api = kGetContactInfoApi + forContact + ".json"
        NetworkCommunicationLayer.getDataFromAPI(apiName: api , contentType: "", params: NSMutableDictionary()) { (response, error, isSuccess) in
            if isSuccess && response != nil {
                let contact = ContactModel.init(fromDictionary: response as! [String:Any])
                completion(contact)
            }
            else {
                completion(nil)
            }
        }
    }
    
    func addToFavorite(contact: ContactModel){
        
    }
    
    func createContact(contactParam: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        let api = kCreateContactApi
        NetworkCommunicationLayer.postDataAPI(apiName: api , contentType: "", params: contactParam) { (response, error, isSuccess) in
            if isSuccess && response != nil {
                let contact = ContactModel.init(fromDictionary: response as! [String:Any])
                completion(contact)
            }
            else {
                completion(nil)
            }
        }
    }
    
    func editContact(contactId: String, param: NSMutableDictionary, completion:@escaping(_ results: ContactModel?) -> ()){
        let api = kUpdateContactInfoApi + contactId + ".json"
        NetworkCommunicationLayer.putDataAPI(apiName: api , contentType: "", params: param) { (response, error, isSuccess) in
            if isSuccess && response != nil {
                let contact = ContactModel.init(fromDictionary: response as! [String:Any])
                completion(contact)
            }
            else {
                completion(nil)
            }
        }
    }
}
