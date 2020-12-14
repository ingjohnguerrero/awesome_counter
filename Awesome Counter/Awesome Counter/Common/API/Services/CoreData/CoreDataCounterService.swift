//
//  CoreDataCounterService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 13/12/20.
//

import Foundation
import UIKit
import CoreData

class CoreDataCounterService: CoreDataService, CounterService {
    // MARK: - Dependencies -

    private let baseService: CounterService

    // MARK: - Initialization -

    init(baseService: CounterService) {
        self.baseService = baseService
    }

    func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
        getCountersDb(completion: completion)
        getCountersBaseService(completion: completion)
    }

    func createCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

}

// MARK: - Database functions -

private extension CoreDataCounterService {
    func getCountersDb(completion: @escaping ([Counter], Error?) -> Void) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }

        let fetchRequest = NSFetchRequest<CoreDataCounter>(entityName: "CoreDataCounter")

        do {
            let coreDataCounters = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            let counters = coreDataCounters.map { $0.convert() }
            completion(counters, nil)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion([], error)
        }
    }

    func createCounterDb(title: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func deleteCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func incrementCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func decrementCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }
}

// MARK: - Base service functions -

private extension CoreDataCounterService {
    func getCountersBaseService(completion: @escaping ([Counter], Error?) -> Void) {

    }

    func createCounterBaseService(title: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func deleteCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func incrementCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func decrementCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }
}
