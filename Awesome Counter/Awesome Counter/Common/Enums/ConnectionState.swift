//
//  ConnectionState.swift
//  Awesome Counter
//
//  Created by John Guerrero on 16/12/20.
//

import Foundation

enum ConnectionState {

    case reachable
    case notReachable

    var imageName: String {
        switch self {
        case .notReachable:
            return "internaldrive"
        case .reachable:
            return "wifi"
        }
    }
}
