//
//  AllContactsPresenter.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class AllContactsPresenter: AllContactsPresenterProtocol {

    weak private var view: AllContactsViewProtocol?
    private let interactor: AllContactsInteractorInputProtocol
    private let wireframe: AllContactsWireframeProtocol

    init(interface: AllContactsView, interactor: AllContactsInteractorInputProtocol, wireframe: AllContactsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

    func getAllContacts(completion: @escaping ([String:[ContactModel]]) -> ()) {
        interactor.getAllContacts { (contacts) in
            completion(contacts)
        }
    }
    
    func showContactDetail(_ forContact: ContactModel) {
        wireframe.showContactDetail(forContact)
    }
}
