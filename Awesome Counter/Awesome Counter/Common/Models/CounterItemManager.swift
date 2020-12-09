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

    var countedTimes: UInt {
        let countedTimesReduced = itemArray.reduce(0) { (lastValue, currentCounter) -> UInt in
            return lastValue + currentCounter.count
        }
        return countedTimesReduced
    }

    var countersInformation: String {

        if itemArray.isEmpty {
            return " · "
        }

        let stringFormat = "%d items · Counted %d times"
        let stringWithFormat = String(format: stringFormat, itemsCount, countedTimes)

        return stringWithFormat
    }

    var onItemAddedClosure: (() -> Void)?

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
        onItemAddedClosure?()
    }

    /// Set items array with given array
    /// - Parameter items: Counter items to populate the item manager
    func setItems(_ items: [Counter]) {
        itemArray = items
        onItemAddedClosure?()
    }

    /// Ask to the manager for an item in the given index
    /// - Parameter index: index to required item
    /// - Returns: Requested counter item
    func item(at index: Int) -> Counter {
        return itemArray[index]
    }

    /// Remove Item at given id
    /// - Parameter id: id of item user want to remove
    func removeItem(byId id: String) {
        if let itemIndex = itemArray.firstIndex(where: { $0.id == id }) {
            itemArray.remove(at: itemIndex)
        }
    }

    /// Increment counter for given counter id
    /// - Parameter counterId: Counter id to increment count
    /// - Returns: Counter count after increment
    func incrementCounter(byId counterId: String) -> UInt {
        guard let itemIndex = itemArray.firstIndex(where: { $0.id == counterId }) else {
            return 0
        }

        itemArray[itemIndex].incrementCount()
        return itemArray[itemIndex].count
    }

    /// Decrement counter for given counter id
    /// - Parameter counterId: Counter id to increment count
    /// - Returns: Counter count after decrement
    func decrementCounter(byId counterId: String) -> UInt {
        guard let itemIndex = itemArray.firstIndex(where: { $0.id == counterId }) else {
            return 0
        }

        itemArray[itemIndex].decrementCount()
        return itemArray[itemIndex].count
    }

}
