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
    let interactor = MainScreenInteractor()
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
        let searchBarIsSubView = view.searchBar?.isDescendant(of: view.view) ?? false
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

//    func test_hasEditButton() {
//        let editButtonIsSubView = view.editButton?.isDescendant(of: view.view) ?? false
//        XCTAssertTrue(editButtonIsSubView)
//    }

    func test_hasCounterLabel() {
        let counterLabelIsSubView = view.counterLabel?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(counterLabelIsSubView)
    }

    func test_hasAddButton() {
        let addButtonIsSubView = view.addButton?.isDescendant(of: view.view) ?? false
    }

    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(view.tableView.dataSource is MainScreenDataProvider)
    }

    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(view.tableView.delegate is MainScreenDataProvider)
    }
}
