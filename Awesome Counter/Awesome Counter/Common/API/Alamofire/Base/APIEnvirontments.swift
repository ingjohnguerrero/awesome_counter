//
//  APIEnvirontments.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation

enum APIEnvironments: String, APIEnvironment {

    case production = "API_baseUrl"

    var baseUrl: String {
        return (Bundle.main.infoDictionary?[self.rawValue] as? String)?
            .replacingOccurrences(of: "\\", with: "") ?? ""
    }

}
