//
//  ContaclDetailInteractor.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContaclDetailInteractor: ContaclDetailInteractorInputProtocol,
    ContaclDetailInteractorOutputProtocol{

    var presenter: ContaclDetailPresenterProtocol?
    var APIDataManager: ContaclDetailAPIDataManagerInputProtocol?
    var localDataManager: ContaclDetailLocalDataManagerInputProtocol?
    
    init() {
        // TODO: USE CUSTOM INITIALIZATION IF YOU WANT TO USE DEPENDENCY INJECTION
        // http://ilya.puchka.me/dependency-injection-in-swift/
        APIDataManager = ContaclDetailAPIDataManager()
        localDataManager = ContaclDetailLocalDataManager()
    }
    
    /**
     * Methods for communication PRESENTER -> INTERACTOR
     */
}
