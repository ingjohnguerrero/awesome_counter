//
//  CounterTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 4/12/20.
//

import XCTest
@testable import Awesome_Counter

class CounterTests: XCTestCase {

    var sut: Counter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Counter(id: "0", title: "counter", count: 1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_instance_isNotNil() {
        XCTAssertNotNil(sut)
    }

    func test_init_withCounterData() {
        XCTAssertEqual(sut.id, "0")
        XCTAssertEqual(sut.title, "counter")
        XCTAssertEqual(sut.count, 1)
    }

    func test_increment_count() {
        sut.incrementCount()
        XCTAssertEqual(sut.count, 2)
    }

    func test_decrement_count() {
        sut.decrementCount()
        XCTAssertEqual(sut.count, 0)
    }

}
