//
//  MainScreenDataProviderTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 3/12/20.
//

import XCTest
@testable import Awesome_Counter

class MainScreenDataProviderTests: XCTestCase {

    var sut: MainScreenDataProvider!
    var tableView: UITableView!
    let wireframe = MainScreenWireframe()
    lazy var view = wireframe.viewController as! MainScreenViewController
    var interactor = MainScreenInteractor()
    lazy var presenter = MainScreenPresenter(view: view, interactor: interactor, wireframe: wireframe)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MainScreenDataProvider()
        sut.itemManager = CounterItemManager()

        view.presenter = presenter
        view.loadViewIfNeeded()

        tableView = view.tableView
        tableView.delegate = sut
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut.itemManager?.removeAll()
    }

    func test_NumberOfSection_IsOne() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }

    func test_NumberOfRows_Section1_IsItemsCount() {
        sut.itemManager?.addItem(Counter(id: "0", title: "Beers", count: 10))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)

        sut.itemManager?.addItem(Counter(id: "1", title: "Coffe cups", count: 12))

        tableView.reloadData()

        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func test_CellForRow_ReturnsItemCell() {

        sut.itemManager?.addItem(Counter(id: "0", title: "Beers", count: 10))

        tableView.reloadData()

        let cell =
            tableView.cellForRow(at: IndexPath(row: 0,
                                               section: 0))

        XCTAssertTrue(cell is CounterTableViewCell)
    }

    func test_CellForRow_DequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        sut.itemManager?.addItem(Counter(id: "0", title: "Beers", count: 10))
        mockTableView.reloadData()

        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))

        XCTAssertTrue(mockTableView.cellGotDequeued)
    }

    func test_CellForRow_CallsConfigCell() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        let item = Counter(id: "0", title: "Beers", count: 10)
        sut.itemManager?.addItem(item)
        mockTableView.reloadData()

        let cell = mockTableView
            .cellForRow(
                at: IndexPath(row: 0, section: 0))
            as! MockItemCell

        XCTAssertEqual(cell.catchedItem?.title, item.title)
    }

}

extension MainScreenDataProviderTests {

    class MockTableView: UITableView {
        var cellGotDequeued = false

        class func mockTableView(
            withDataSource dataSource: UITableViewDataSource)
        -> MockTableView {

            let mockTableView = MockTableView(
                frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                style: .plain)

            mockTableView.dataSource = dataSource
            mockTableView.register(MockItemCell.self,
                                   forCellReuseIdentifier: "CounterTableViewCell")

            return mockTableView
        }

        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath) -> UITableViewCell {

            cellGotDequeued = true

            return super.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath)
        }
    }

    class MockItemCell : CounterTableViewCell {
        var catchedItem: Counter?


        override func configCell(with item: Counter) {
            catchedItem = item
        }
    }

}
