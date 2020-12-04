//
//  MainScreenItemManagerTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 4/12/20.
//

import XCTest
@testable import Awesome_Counter

class MainScreenItemManagerTests: XCTestCase {

    var sut: CounterItemManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CounterItemManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut.removeAll()
        sut = nil
    }

    func test_CountersCount_Initially_IsZero() {
        XCTAssertEqual(sut.itemsCount, 0)
    }

    func test_AddItem_IncreasesCountersCountToOne() {
        let counter = Counter(id: 0, title: "Beers", count: 2)
        sut.addItem(counter)
        XCTAssertEqual(sut.itemsCount, 1)
    }

    func test_RemoveItem_ById() {
        sut.addItem(Counter(id: 0, title: "Beers", count: 2))
        sut.removeItem(byId: 0)
        XCTAssertEqual(sut.itemsCount, 0)
    }

}
