//
//  APIContext.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

protocol APIEnvironment {
    var baseUrl: String { get }
}

protocol APIContext {
    var environment: APIEnvironment { get set }
}
