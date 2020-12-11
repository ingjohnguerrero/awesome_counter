//
//  APICounterServiceTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 11/12/20.
//

import XCTest
@testable import Awesome_Counter

class APICounterServiceTests: XCTestCase {

    var environment: APIEnvironments!
    var context: DevelopmentAPIContext!
    var sut: AlamofireCounterService!
    let testId: String = "kikjwom9"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        environment = APIEnvironments.production
        context = DevelopmentAPIContext(environment: environment)
        sut = AlamofireCounterService(context: context)
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

        sut.deleteCounter(byId: testId) { (responseCounters, responseError) in
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

        sut.incrementCounter(byId: testId) { (responseCounters, responseError) in
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

        sut.decrementCounter(byId: testId) { (responseCounters, responseError) in
            counters = responseCounters
            error = responseError
            gettingCountersExpection.fulfill()
        }

        wait(for: [gettingCountersExpection], timeout: 3)
        XCTAssertNil(error)
        XCTAssertFalse(counters.isEmpty)
    }

}
