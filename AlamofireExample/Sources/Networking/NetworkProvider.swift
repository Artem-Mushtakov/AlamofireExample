//
//  NetworkProvider.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Alamofire

enum NetworkProvider: UrlRequestBuilder {
    
    case showCharacters
    
    var patch: String {
        switch self {
        case .showCharacters:
            return "/v1/cards/"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .showCharacters:
            return ["name" : "Black Lotus"]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .showCharacters:
            return .get
        }
    }
}
