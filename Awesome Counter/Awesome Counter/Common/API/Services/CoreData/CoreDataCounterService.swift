//
//  CoreDataCounterService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 13/12/20.
//

import Foundation
import UIKit
import CoreData
import Alamofire

class CoreDataCounterService: CoreDataService, CounterService {

    // MARK: - Dependencies -
    private let baseService: CounterService

    // MARK: - Initialization -

    init(baseService: CounterService) {
        self.baseService = baseService
    }

    func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
        getCountersBaseService(completion: completion)
    }

    func createCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {
        createCounterBaseService(title: title, completion: completion)
    }

    func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        deleteCounterBaseService(byId: id, completion: completion)
    }

    func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        incrementCounterBaseService(byId: id, completion: completion)
    }

    func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        decrementCounterBaseService(byId: id, completion: completion)
    }

}

// MARK: - Database functions -

extension CoreDataCounterService {
    func getCountersDb(completion: @escaping ([Counter], Error?) -> Void) {
        guard let managedContext = managedContext else { return }

        let fetchRequest = NSFetchRequest<CoreDataCounter>(entityName: "CoreDataCounter")

        do {
            let coreDataCounters = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            let counters = coreDataCounters.map { $0.convert() }
            completion(counters, nil)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            return
        }
    }

    func createCounterDb(title: String, completion: @escaping ([Counter], Error?) -> Void) {
        guard let context = managedContext else { return }
        let counter = CoreDataCounter(context: context)
        counter.id = "\(Int.random(in: 1...1000))"
        counter.title = title
        counter.count = 0
        do {
            try context.save()
            print("Successfully saved data.")
            getCountersDb(completion: completion)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion([], error)
        }
    }

    func deleteCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func incrementCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func decrementCounterDb(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {

    }

    func deleteAllCounters() {
        guard let context = managedContext else { return }
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CoreDataCounter")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            let result = try context.execute(deleteRequest)
        } catch let error as NSError {
            // TODO: handle the error
        }
    }

    func persist(_ counter: Counter) {
        persist([counter])
    }

    func persist(_ counters: [Counter]) {
        guard let context = managedContext else { return }
        deleteAllCounters()

        _ = counters.map { (counter) -> CoreDataCounter in
            let coreDataCounter = CoreDataCounter(context: context)
            coreDataCounter.initWithCounter(from: counter)
            return coreDataCounter
        }

        do {
            try context.save()
            print("Successfully saved data.")
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
        }
    }
}

// MARK: - Base service functions -

private extension CoreDataCounterService {
    func getCountersBaseService(completion: @escaping ([Counter], Error?) -> Void) {
        baseService.getCounters { [weak self] (responseCounters, responseError) in
            self?.persist(responseCounters)
            completion(responseCounters, responseError)
        }
    }

    func createCounterBaseService(title: String, completion: @escaping ([Counter], Error?) -> Void) {
        baseService.createCounter(title: title) { [weak self] (responseCounters, responseError) in
            self?.persist(responseCounters)
            completion(responseCounters, responseError)
        }
    }

    func deleteCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        baseService.deleteCounter(byId: id) { [weak self] (responseCounters, responseError) in
            self?.persist(responseCounters)
            completion(responseCounters, responseError)
        }
    }

    func incrementCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        baseService.incrementCounter(byId: id) { [weak self] (responseCounters, responseError) in
            self?.persist(responseCounters)
            completion(responseCounters, responseError)
        }
    }

    func decrementCounterBaseService(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        baseService.decrementCounter(byId: id) { [weak self] (responseCounters, responseError) in
            self?.persist(responseCounters)
            completion(responseCounters, responseError)
        }
    }
}
