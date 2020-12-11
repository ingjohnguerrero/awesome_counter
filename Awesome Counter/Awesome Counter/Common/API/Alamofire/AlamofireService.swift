//
//  AlamofireService.swift
//  Awesome Counter
//
//  Created by John Guerrero on 11/12/20.
//

import Foundation
import Alamofire

class AlamofireService {

    init(context: APIContext) {
        self.context = context
    }

    var context: APIContext

    func get(at route: APIRoute) -> DataRequest {
        return request(at: route, method: .get, encoding: URLEncoding.default)
    }

    func post(at route: APIRoute, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .post, params: params, encoding: JSONEncoding.default)
    }

    func put(at route: APIRoute, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .put, params: params, encoding: JSONEncoding.default)
    }

    func delete(at route: APIRoute, params: Parameters = [:]) -> DataRequest {
        return request(at: route, method: .delete, params: params, encoding: JSONEncoding.default)
    }

    func request(
        at route: APIRoute,
        method: HTTPMethod,
        params: Parameters = [:],
        encoding: ParameterEncoding
    ) -> DataRequest {
        let routeUrl = route.url(for: context.environment)
        return AF
            .request(routeUrl, method: method, parameters: params, encoding: encoding)
            .validate()
    }
}
