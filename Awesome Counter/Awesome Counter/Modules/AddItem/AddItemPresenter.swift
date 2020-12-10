//
//  AddItemPresenter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 10/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class AddItemPresenter {

    // MARK: - Private properties -

    private unowned let view: AddItemViewInterface
    private let interactor: AddItemInteractorInterface
    private let wireframe: AddItemWireframeInterface

    // MARK: - Lifecycle -

    init(view: AddItemViewInterface, interactor: AddItemInteractorInterface, wireframe: AddItemWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension AddItemPresenter: AddItemPresenterInterface {
}