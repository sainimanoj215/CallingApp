//
//  AllContactsAPIDataManager.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsAPIDataManager: AllContactsAPIDataManagerInputProtocol {

    init() {}
    
    // Data fetch service methods goes here
    func getAllContacts(completion: @escaping ([ContactModel]) -> ()) {
        NetworkCommunicationLayer.getDataFromAPI(apiName: kGetAllContactsApi, contentType: "", params: NSMutableDictionary()) { (response, error, isSuccess) in
            if isSuccess && response != nil {
                let contacts = ContactModel.PopulateArray(array: response as? [[String:Any]] ?? [])
                completion(contacts)
            }
            else {
                completion([])
            }
        }
    }
}
