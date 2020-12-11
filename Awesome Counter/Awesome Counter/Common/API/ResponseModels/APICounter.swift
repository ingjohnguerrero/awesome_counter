//
//  APICounter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

struct APICounter: Codable {
    var id: String?
    var title: String?
    var count: UInt?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case count
    }

    func convert() -> Counter {
        return Counter(id: id ?? "", title: title ?? "", count: count ?? 0)
    }
}
