//
//  WelcomeUserTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 2/12/20.
//

import XCTest
@testable import Awesome_Counter

class WelcomeUserTests: XCTestCase {

    let wireframe = WelcomeUserWireframe()
    lazy var view = wireframe.viewController as! WelcomeUserViewController
    lazy var presenter = WelcomeUserPresenter(view: view, wireframe: wireframe)

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

    func test_hasTitleLabel() {
        let titleLabelIsSubView = view.titleLabel?.isDescendant(of: view.view) ?? false
        let appNameLabelIsSubView = view.appNameLabel?.isDescendant(of: view.view) ?? false
        XCTAssertTrue(titleLabelIsSubView)
        XCTAssertTrue(appNameLabelIsSubView)
    }

    func test_hasDescriptionLabel() {
        XCTAssertTrue(view.descriptionLabel?.isDescendant(of: view.view) ?? false)
    }

    func test_TableView_AfterViewDidLoad_IsNotNil() {
      XCTAssertNotNil(view.tableView)
    }

    func test_NumberOfSections_IsOne() {
        let numberOfSections = view.tableView.numberOfSections
      XCTAssertEqual(numberOfSections, 1)
    }

    func test_NumberOfRows_IsThree() {
        XCTAssertEqual(view.tableView.numberOfRows(inSection: 0), 3)
    }

    func test_LoadingView_SetsTableViewDataSource() {
      XCTAssertTrue(view.tableView.dataSource is WelcomeUserViewController)
    }

    func test_LoadingView_SetsTableViewDelegate() {
      XCTAssertTrue(view.tableView.delegate is WelcomeUserViewController)
    }

    func test_hasContinueButton () {
        XCTAssertTrue(view.continueButton?.isDescendant(of: view.view) ?? false)
    }

}
