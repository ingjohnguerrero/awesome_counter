//
//  APIEnvironmentsTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 11/12/20.
//

import XCTest
@testable import Awesome_Counter

class APIEnvironmentsTests: XCTestCase {

    var sut = APIEnvironments.production

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_ApiEnvirontment_ReturnsBaseURL() {
        print("base url: \(sut.baseUrl)")
        XCTAssertFalse(sut.baseUrl.isEmpty)
    }
}
