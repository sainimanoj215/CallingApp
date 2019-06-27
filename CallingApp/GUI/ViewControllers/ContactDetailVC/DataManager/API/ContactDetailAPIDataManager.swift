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
}
