//
//  URLRequestBuilder.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation
import Alamofire

protocol UrlRequestBuilder: URLRequestConvertible {
    var baseUrl: String { get }
    var patch: String { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
}

extension UrlRequestBuilder {
    var baseUrl: String {
        return "https://api.magicthegathering.io/"
    }

    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()

        var request = URLRequest(url: url.appendingPathComponent(patch))
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        switch method {
        case .get:
            request.allHTTPHeaderFields = headers?.dictionary
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            break
        }
        return request
    }
}
