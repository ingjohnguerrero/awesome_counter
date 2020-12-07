//
//  CounterTableViewCellTests.swift
//  Awesome CounterTests
//
//  Created by John Guerrero on 5/12/20.
//

import XCTest
@testable import Awesome_Counter

class CounterTableViewCellTests: XCTestCase {

    var tableView: UITableView!
    let dataSource = FakeDataSource()
    var cell: CounterTableViewCell!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let wireframe = MainScreenWireframe()
        let controller = wireframe.viewController as! MainScreenViewController

        controller.loadViewIfNeeded()


        tableView = controller.tableView
        tableView?.dataSource = dataSource


        cell = tableView?.dequeueReusableCell(
          withIdentifier: "CounterTableViewCell",
          for: IndexPath(row: 0, section: 0)) as! CounterTableViewCell
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_HasTitleLabel() {
        XCTAssert(cell.titleLabel.isDescendant(of: cell.contentView))
    }

    func test_HasCounterLabel() {
        XCTAssert(cell.countLabel.isDescendant(of: cell.contentView))
    }

    func test_HasIncrementButton() {
        XCTAssert(cell.incrementButton.isDescendant(of: cell.contentView))
    }

    func test_HasDecrementButton() {
        XCTAssert(cell.decrementButton.isDescendant(of: cell.contentView))
    }

    func test_ConfigCell_SetsTitle() {
        let counter = Counter(id: 0, title: "Cups of coffee", count: 2)
        cell.configCell(with: counter)

        XCTAssertEqual(cell.titleLabel.text, counter.title)
    }

    func test_ConfigCell_SetsCount() {
        let counter = Counter(id: 0, title: "Cups of coffee", count: 2)
        cell.configCell(with: counter)

        XCTAssertEqual(cell.countLabel.text, "\(counter.count)")
    }
}

extension CounterTableViewCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {


      func tableView(_ tableView: UITableView,
                     numberOfRowsInSection section: Int) -> Int {


        return 1
      }



      func tableView(_ tableView: UITableView,
                     cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {


          return UITableViewCell()
      }
    }
}
