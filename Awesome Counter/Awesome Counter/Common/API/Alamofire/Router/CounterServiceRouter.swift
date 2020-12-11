//
//  CounterServiceRouter.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

enum CounterServiceRouter: APIRoute {
    case getCounters
    case counterOperations
    case incrementCounter
    case decrementCounter

    var path: String {
        switch self {
        case .getCounters:
            return "api/v1/counters"
        case .counterOperations:
            return "api/v1/counter"
        case .incrementCounter:
            return "api/v1/counter/inc"
        case .decrementCounter:
            return "api/v1/counter/dec"
        }
    }
}
