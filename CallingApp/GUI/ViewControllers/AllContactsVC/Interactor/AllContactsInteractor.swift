//
//  AllContactsInteractor.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsInteractor: AllContactsInteractorInputProtocol, AllContactsInteractorOutputProtocol{
    
    var presenter: AllContactsPresenterProtocol?
    var APIDataManager: AllContactsAPIDataManagerInputProtocol?
    var localDataManager: AllContactsLocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = AllContactsAPIDataManager()
        localDataManager = AllContactsLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
    
    func getAllContacts(completion: @escaping ([String:[ContactModel]]) -> ()) {
        APIDataManager?.getAllContacts(completion: { (contacts) in
            completion(self.arrangeContacts(contacts: contacts))
        })
    }
    
    func arrangeContacts(contacts: [ContactModel]) -> [String:[ContactModel]] {
        let tmpArr = contacts.sorted { (cont1, cont2) -> Bool in
            cont1.firstName!.uppercased() < cont2.firstName!.uppercased()
        }
        var sectionedData: [String: [ContactModel]] = [:]
        tmpArr.forEach {
            guard let firstLetter = $0.firstName!.first else {
                sectionedData["#"] = (sectionedData["#"] ?? []) + [$0]
                return
            }
            var firstLetterStr = String(firstLetter).uppercased()
            let alpha = firstLetterStr.range(of: "[a-zA-Z]", options: .regularExpression)
            if (alpha == nil) {
                firstLetterStr = "#"
            }
            sectionedData[firstLetterStr] = (sectionedData[firstLetterStr] ?? []) + [$0]
        }
        return sectionedData
    }
}
