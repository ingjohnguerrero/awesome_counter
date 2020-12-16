//
//  CoreDataCounterServiceTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 15/12/20.
//

import XCTest
@testable import Awesome_Counter

class CoreDataCounterServiceTests: XCTestCase {

    let baseService: CounterService = MockCounterService()
    var sut: CoreDataCounterService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CoreDataCounterService(baseService: baseService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_GettingCounter_UpdatesDb() {
        var counters: [Counter] = []
        let getCounterExpectation = expectation(description: "Getting counters expectation")
        sut.getCounters { (responseCounters, responseError) in
            counters = responseCounters
            getCounterExpectation.fulfill()
        }
        wait(for: [getCounterExpectation], timeout: 3)
        XCTAssertFalse(counters.isEmpty)
    }

    func test_GettingCounter_RespectsCountersCount() {
        var counters: [Counter] = []
        let getCounterExpectation = expectation(description: "Getting counters expectation")
        sut.getCountersDb { (responseCounters, responseError) in
            counters = responseCounters
            getCounterExpectation.fulfill()
        }
        wait(for: [getCounterExpectation], timeout: 3)
        XCTAssertFalse(counters.isEmpty)
        XCTAssertEqual(counters.count, 2)
    }

}

extension CoreDataCounterServiceTests {

    class MockCounterService: CounterService {
        let mockCounters = [
            Counter(id: "abc", title: "Beers", count: 0),
            Counter(id: "abc", title: "Beers", count: 0)
        ]

        func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
            completion(mockCounters, nil)
        }

        func createCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {
            completion(mockCounters, nil)
        }

        func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            completion(mockCounters, nil)
        }

        func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            completion(mockCounters, nil)
        }

        func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            completion(mockCounters, nil)
        }
    }
}
