//
//  CounterService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

protocol CounterService: class {
    typealias CountersDataResponse = (_ counter: [Counter],_ error: Error?) -> Void

    func getCounters(completion: @escaping CounterService.CountersDataResponse)
    func createCounter(title: String, completion: @escaping CounterService.CountersDataResponse)
    func deleteCounter(byId id: String, completion: @escaping CounterService.CountersDataResponse)
    func incrementCounter(byId id: String, completion: @escaping CounterService.CountersDataResponse)
    func decrementCounter(byId id: String, completion: @escaping CounterService.CountersDataResponse)
}
