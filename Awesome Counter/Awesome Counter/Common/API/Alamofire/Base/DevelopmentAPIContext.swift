//
//  DevelopmentAPIContext.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

class DevelopmentAPIContext: APIContext {
    var environment: APIEnvironment

    init(environment: APIEnvironment) {
        self.environment = environment
    }
}
