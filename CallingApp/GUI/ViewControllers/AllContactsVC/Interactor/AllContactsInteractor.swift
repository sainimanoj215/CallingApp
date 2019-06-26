//
//  AllContactsInteractor.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsInteractor: AllContactsInteractorInputProtocol,
    AllContactsInteractorOutputProtocol{

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
}
