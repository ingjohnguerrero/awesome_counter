//
//  CounterItemManager.swift
//  Awesome Counter
//
//  Created by John Guerrero on 4/12/20.
//

import Foundation

/// Item manager for counters
class CounterItemManager: NSObject {

    // MARK: - Public properties -

    /// Counter items in manager
    var itemsCount: Int { return itemArray.count }

    // MARK: - Private properties -

    /// Array of user counters
    private var itemArray: [Counter] = []

    /// Remove all counter items in manager
    func removeAll() {
        itemArray.removeAll()
    }

    /// Add a new item to counter's array
    /// - Parameter item: Counter item to be added
    func addItem(_ item: Counter) {
        itemArray.append(item)
    }

    func removeItem(byId id: UInt) {
        if let itemIndex = itemArray.firstIndex(where: { $0.id == id }) {
            itemArray.remove(at: itemIndex)
        }
    }
}
