//
//  CoreDataCounter+Extensions.swift
//  Awesome Counter
//
//  Created by John Guerrero on 14/12/20.
//

import Foundation
import CoreData

extension CoreDataCounter {

    func initWithCounter(from counter: Counter) {
        self.id = counter.id
        self.title = counter.title
        self.count = Int32(counter.count)
    }

    func convert() -> Counter {
        let uCount = UInt((count <= -1) ? 0 : count)
        return Counter(id: self.id ?? "", title: self.title ?? "", count: UInt(uCount))
    }
}
