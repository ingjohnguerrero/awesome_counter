//
//  MainScreenDataProvider.swift
//  Awesome Counter
//
//  Created by John Guerrero on 3/12/20.
//

import Foundation
import UIKit

class MainScreenDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource, ItemManagerSettable, SearchableDataProvider {

    var itemManager: CounterItemManager?
    var searchTerm: String = ""
    var isUserSearching: Bool {
        !searchTerm.isEmpty
    }
    var tempSearchResults: [Counter] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isUserSearching {
            return tempSearchResults.count
        } else {
            return itemManager?.itemsCount ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CounterTableViewCell", for: indexPath) as? CounterTableViewCell, let counterItem = itemManager?.item(at: indexPath.row) else {
            return UITableViewCell()
        }

        if isUserSearching {
            cell.configCell(with: tempSearchResults[indexPath.row])
        } else {
            cell.configCell(with: counterItem)
        }

        return cell
    }

    func updateSearchTerm(_ term: String) {
        searchTerm = term
        tempSearchResults = itemManager?.search(byTerm: searchTerm) ?? []
    }

    func getCountersIds(of indexPaths: [IndexPath]) -> [String] {

        let counterIds = indexPaths.map { (indexPath) -> String in
            if isUserSearching {
                return tempSearchResults[indexPath.row].id
            } else {
                return itemManager?.item(at: indexPath.row).id ?? ""
            }
        }

        return counterIds
    }
}

@objc protocol ItemManagerSettable {
  var itemManager: CounterItemManager? { get set }
}
