//
//  MainScreenTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 2/12/20.
//

import XCTest
@testable import Awesome_Counter

class MainScreenTests: XCTestCase {

    let wireframe = MainScreenWireframe()
    let interactor = MockMainScreenInteraction()
    lazy var view = wireframe.viewController as! MainScreenViewController
    lazy var presenter = MainScreenPresenter(view: view, interactor: interactor, wireframe: wireframe)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view.presenter = presenter
        view.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Presenter_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(presenter)
    }

    func test_hasSearchBox() {
        let searchBarIsSubView = (view.searchBar != nil)
        XCTAssertTrue(searchBarIsSubView)
    }

    func test_hasTableView() {
        let tableViewIsSubView = view.tableView?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(tableViewIsSubView)
    }

    func test_hasEmptyView() {
        let emptyViewIsSubView = view.emptyView?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(emptyViewIsSubView)
    }

    func test_hasCounterLabel() {
        let counterLabelIsSubView = view.countersInformationLabel?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(counterLabelIsSubView)
    }

    func test_hasAddButton() {
        let addButtonIsSubView = view.addButton?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(addButtonIsSubView)
    }

    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(view.tableView.dataSource is MainScreenDataProvider)
    }

    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(view.tableView.delegate is MainScreenDataProvider)
    }

    func test_ViewDidLoad_SetsItemManagerToDataProvider() {
      XCTAssertTrue(view.itemManager === view.dataProvider.itemManager)
    }

    func test_ReloadData_SetsCounterInformationLabel() {
        let coffeCounter = Counter(id: "0", title: "Cups of coffee", count: 5)
        let beerCounter = Counter(id: "1", title: "Glasses of beer", count: 6)
        view.itemManager?.addItem(coffeCounter)
        view.itemManager?.addItem(beerCounter)
        let stringFormat = "%d items · Counted %d times"
        let stringWithFormat = String(format: stringFormat, 2, 11)

        XCTAssertEqual(stringWithFormat, view.countersInformationLabel.text)
    }

    func test_IncrementCounter_SetsCounterInformationLabel() {
        let coffeCounter = Counter(id: "0", title: "Cups of coffee", count: 5)
        let beerCounter = Counter(id: "1", title: "Glasses of beer", count: 6)
        view.itemManager?.addItem(coffeCounter)
        view.itemManager?.addItem(beerCounter)

        NotificationCenter.default.post(
          name: NSNotification.Name("CounterIncrementedNotification"),
          object: self,
            userInfo: ["counterId": coffeCounter.id])

        let stringFormat = "%d items · Counted %d times"
        let stringWithFormat = String(format: stringFormat, 2, 12)

        XCTAssertEqual(stringWithFormat, view.itemManager?.countersInformation)
    }

    func test_DecrementCounter_SetsCounterInformationLabel() {
        let coffeCounter = Counter(id: "0", title: "Cups of coffee", count: 5)
        let beerCounter = Counter(id: "1", title: "Glasses of beer", count: 6)
        view.itemManager?.addItem(coffeCounter)
        view.itemManager?.addItem(beerCounter)

        guard let cell = view.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? CounterTableViewCell else {
            XCTFail()
            return
        }
        cell.decrementButton.sendActions(for: UIControl.Event.touchUpInside)

        let stringFormat = "%d items · Counted %d times"
        let stringWithFormat = String(format: stringFormat, 2, 10)

        XCTAssertEqual(stringWithFormat, view.countersInformationLabel.text)
    }

}

extension MainScreenTests {
    class MockMainScreenInteraction: MainScreenInteractorInterface {
        func getCounters(completion: @escaping ([Counter], Error?) -> Void) {
            completion([], nil)
        }
    }
}
