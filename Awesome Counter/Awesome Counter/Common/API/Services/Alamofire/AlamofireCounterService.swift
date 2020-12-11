//
//  AlamofireCounterService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

class AlamofireCounterService: AlamofireService, CounterService {
    func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
        get(at: CounterServiceRouter.getCounters).responseDecodable(of: [APICounter].self) { (response) in
            guard let apiCounters = response.value else {
                completion([], response.error)
                return
            }
            let counters = apiCounters.map({ $0.convert() })
            completion(counters, nil)
        }
    }

    func createCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {
        post(at: CounterServiceRouter.counterOperations, params: ["title":title]).responseDecodable(of: [APICounter].self) { (response) in
            guard let apiCounters = response.value else {
                completion([], response.error)
                return
            }
            let counters = apiCounters.map({ $0.convert() })
            completion(counters, nil)
        }
    }

    func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        delete(at: CounterServiceRouter.counterOperations, params: ["id":id]).responseDecodable(of: [APICounter].self) { (response) in
            guard let apiCounters = response.value else {
                completion([], response.error)
                return
            }
            let counters = apiCounters.map({ $0.convert() })
            completion(counters, nil)
        }
    }

    func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        post(at: CounterServiceRouter.incrementCounter, params: ["id":id]).responseDecodable(of: [APICounter].self) { (response) in
            guard let apiCounters = response.value else {
                completion([], response.error)
                return
            }
            let counters = apiCounters.map({ $0.convert() })
            completion(counters, nil)
        }
    }

    func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
        post(at: CounterServiceRouter.decrementCounter, params: ["id":id]).responseDecodable(of: [APICounter].self) { (response) in
            guard let apiCounters = response.value else {
                completion([], response.error)
                return
            }
            let counters = apiCounters.map({ $0.convert() })
            completion(counters, nil)
        }
    }
}
