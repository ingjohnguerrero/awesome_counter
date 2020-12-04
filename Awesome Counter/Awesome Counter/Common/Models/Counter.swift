//
//  Counter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 4/12/20.
//

import Foundation

struct Counter {
    var id: UInt = 0
    var title: String = ""
    var count: UInt = 0

    mutating func incrementCount() {
        count += 1
    }

    mutating func decrementCount() {
        count -= 1
    }
}
