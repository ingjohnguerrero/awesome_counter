//
//  AddItemTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 10/12/20.
//

import XCTest
@testable import Awesome_Counter

class AddItemTests: XCTestCase {

    var onAddItemClosure: (() -> Void)!
    lazy var wireframe = AddItemWireframe(onAddItemClosure: onAddItemClosure)
    let interactor = AddItemInteractor()
    lazy var view = wireframe.viewController as! AddItemViewController
    lazy var presenter = AddItemPresenter(view: view, interactor: interactor, wireframe: wireframe, onAddItemClosure: onAddItemClosure)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        onAddItemClosure = { () -> Void in
        }
        view.presenter = presenter
        view.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_hasTableView() {
        XCTAssertTrue(view.counterTitleLabel?.isDescendant(of: view.view) ?? false)
    }
}
