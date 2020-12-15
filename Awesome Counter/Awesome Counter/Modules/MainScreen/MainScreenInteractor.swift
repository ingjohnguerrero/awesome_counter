//
//  MainScreenInteractor.swift
//  Awesome Counter
//
//  Created by John Guerrero on 2/12/20.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class MainScreenInteractor {
    let context = DevelopmentAPIContext(environment: APIEnvironments.production)
    lazy var counterService: CounterService! = AlamofireCounterService(context: context)
    lazy var coreDataCounterService: CounterService = CoreDataCounterService(baseService: counterService)
}

// MARK: - Extensions -

extension MainScreenInteractor: MainScreenInteractorInterface {

    func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
        coreDataCounterService.getCounters(completion: completion)
    }

    func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        coreDataCounterService.incrementCounter(byId: id, completion: completion)
    }

    func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        coreDataCounterService.decrementCounter(byId: id, completion: completion)
    }

    func addCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {
        coreDataCounterService.createCounter(title: title, completion: completion)
    }

    func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        coreDataCounterService.deleteCounter(byId: id, completion: completion)
    }
}
