//
//  APIRoute.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

/// `ApiRoute` stores all the routes in order to access to web services more easily.
protocol APIRoute {
    var path: String { get }
    /// Url generator based on the route requested
    /// - Parameter environment: current environment in context
    func url(for environment: APIEnvironment) -> String
}

extension APIRoute {
    /// method to get the full url to api route
    /// - parameters:
    ///     - environment: Api environment
    /// - returns: String with the complete url to resource
    func url(for environment: APIEnvironment) -> String {
        return "\(environment.baseUrl)/\(path)"
    }
}
