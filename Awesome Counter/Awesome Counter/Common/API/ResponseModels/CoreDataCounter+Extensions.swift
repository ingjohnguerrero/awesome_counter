//
//  CoreDataCounter+Extensions.swift
//  Awesome Counter
//
//  Created by John Guerrero on 14/12/20.
//

import Foundation

extension CoreDataCounter {
    func convert() -> Counter {
        let uCount = UInt((count <= -1) ? 0 : count)
        return Counter(id: self.id ?? "", title: self.title ?? "", count: UInt(uCount))
    }
}
