//
//  MockCounterServiceTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 11/12/20.
//

import XCTest
@testable import Awesome_Counter

class MockCounterServiceTests: XCTestCase {

    var sut: CounterService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockCounterService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_GetCounters_ParsesResponse() {
        var counters: [Counter] = []
        var error: Error?
        let gettingCountersExpection = expectation(description: "getting counters expectation")
        sut.getCounters { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }
        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

    func test_CreateCounter_WithNoError() {
        var counters: [Counter] = []
        var error: Error?
        let gettingCountersExpection = expectation(description: "adding counter expectation")

        sut.createCounter(title: "Cups of coffe") { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }
        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

    func test_DeleteCounter_WithNoError() {
        var counters: [Counter] = []
        var error: Error?
        let gettingCountersExpection = expectation(description: "deleting counter expectation")

        sut.deleteCounter(byId: "abcd") { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }

        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

    func test_IncrementCounter_WithNoError() {
        var counters: [Counter] = []
        var error: Error?
        let gettingCountersExpection = expectation(description: "incrementing counter expectation")

        sut.incrementCounter(byId: "abcd") { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }

        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

    func test_DecrementCounter_WithNoError() {
        var counters: [Counter] = []
        var error: Error?
        let gettingCountersExpection = expectation(description: "incrementing counter expectation")

        sut.decrementCounter(byId: "abcd") { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }

        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

}

extension MockCounterServiceTests {

    class MockCounterService: CounterService {

        let getCountersJson = """
        [
            {"id": "asdf", "title": "boop",  "count": 4},
            {"id": "zxcv", "title": "steve", "count": 3}
        ]
        """

        func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
            let jsonData = getCountersJson.data(using: .utf8)!
            do {
                let apiCounters = try JSONDecoder().decode([APICounter].self, from: jsonData)
                let counters = apiCounters.map ({ $0.convert() })
                completion(counters, nil)
            } catch {
                print("Parsing Error: \(error.self)")
                completion([], error)
            }
        }

        func createCounter(title: String, completion: @escaping ([Counter], Error?) -> Void) {
            getCounters(completion: completion)
        }

        func deleteCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            getCounters(completion: completion)
        }

        func incrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            getCounters(completion: completion)
        }

        func decrementCounter(byId id: String, completion: @escaping ([Counter], Error?) -> Void) {
            getCounters(completion: completion)
        }
    }

}
