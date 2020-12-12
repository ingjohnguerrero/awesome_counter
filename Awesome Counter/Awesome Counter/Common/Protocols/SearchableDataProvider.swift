//
//  SearchableDataProvider.swift
//  Awesome Counter
//
//  Created by John Guerrero on 10/12/20.
//

import Foundation

@objc protocol SearchableDataProvider {
    func updateSearchTerm(_ term: String)
    func getCountersIds(of indexPaths: [IndexPath]) -> [String]
}
