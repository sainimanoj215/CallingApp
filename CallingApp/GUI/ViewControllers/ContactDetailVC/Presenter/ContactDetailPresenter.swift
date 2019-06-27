//
//  ContaclDetailPresenter.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit

class ContaclDetailPresenter: ContaclDetailPresenterProtocol {

    weak private var view: ContaclDetailViewProtocol?
    private let interactor: ContaclDetailInteractorInputProtocol
    private let wireframe: ContaclDetailWireframeProtocol

    init(interface: ContaclDetailView, interactor: ContaclDetailInteractorInputProtocol, wireframe: ContaclDetailWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.wireframe = wireframe

        self.interactor.presenter = self
    }

}
