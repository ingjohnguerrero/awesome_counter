//
//  APIRouterTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 11/12/20.
//

import XCTest
@testable import Awesome_Counter

class APIRouterTests: XCTestCase {

    var environment: APIEnvironments!
    var context: DevelopmentAPIContext!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        environment = APIEnvironments.production
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_RouterUrl_ReturnsFullUrl() {
        let routerUrl = CounterServiceRouter.getCounters.url(for: environment)
        let expectedUrl = "\(environment.baseUrl)/\(CounterServiceRouter.getCounters.path)"
        XCTAssertEqual(expectedUrl, routerUrl)
    }

}
