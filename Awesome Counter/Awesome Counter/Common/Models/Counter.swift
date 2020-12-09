//
//  Counter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 4/12/20.
//

import Foundation

struct Counter {
    var id: String = ""
    var title: String = ""
    var count: UInt = 0

    mutating func incrementCount() {
        count += 1
    }

    mutating func decrementCount() {
        count = (count == 0) ? 0 : count - 1
    }

    func countString() -> String {
        return "\(count)"
    }
}
