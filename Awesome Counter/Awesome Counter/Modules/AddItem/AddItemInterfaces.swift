//
//  AddItemInterfaces.swift
//  Awesome Counter
//
//  Created by John Guerrero on 10/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol AddItemWireframeInterface: WireframeInterface {
    func presentErrorAlert()
    func goBack()
}

protocol AddItemViewInterface: ViewInterface {
}

protocol AddItemPresenterInterface: PresenterInterface {
    func saveCounter(title: String)
    func goBack()
}

protocol AddItemInteractorInterface: InteractorInterface {
    func addCounter(title: String, completion: @escaping CounterService.CountersDataResponse)
}
