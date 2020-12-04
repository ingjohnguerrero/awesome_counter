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

        view.presenter = presenter
        view.loadViewIfNeeded()

        tableView = view.tableView
        tableView.delegate = sut
        tableView.dataSource = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NumberOfSection_IsOne() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }

}
