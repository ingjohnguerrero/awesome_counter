//
//  MainScreenDataProvider.swift
//  Awesome Counter
//
//  Created by John Guerrero on 3/12/20.
//

import Foundation
import UIKit

class MainScreenDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {

    var itemManager: CounterItemManager?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemManager?.itemsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CounterTableViewCell", for: indexPath) as? CounterTableViewCell, let counterItem = itemManager?.item(at: indexPath.row) else {
            return UITableViewCell()
        }

        cell.configCell(with: counterItem)

        return cell
    }
}
