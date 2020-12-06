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

    func test_ItemAt_ReturnsAddedItem() {
      let item = Counter(id: 0, title: "Beers", count: 2)
      sut.addItem(item)

      let returnedItem = sut.item(at: 0)

      XCTAssertEqual(returnedItem.title, item.title)
    }

    func test_RemoveItem_ById() {
        sut.addItem(Counter(id: 0, title: "Beers", count: 2))
        sut.removeItem(byId: 0)
        XCTAssertEqual(sut.itemsCount, 0)
    }

    func test_RemoveAll_ResultsInCountBeZero() {

        let counter = Counter(id: 0, title: "Beers", count: 2)
        sut.addItem(counter)


        XCTAssertEqual(sut.itemsCount, 1)

        sut.removeAll()

        XCTAssertEqual(sut.itemsCount, 0)
    }

    func test_CountedTimes_AllItems() {
        let beerCounter = Counter(id: 0, title: "Beers", count: 2)
        sut.addItem(beerCounter)

        let coffeeCounter = Counter(id: 1, title: "Coffee cups", count: 3)
        sut.addItem(coffeeCounter)

        XCTAssertEqual(sut.countedTimes, 5)
    }

}
