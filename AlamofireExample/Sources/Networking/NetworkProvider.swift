//
//  NetworkProvider.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Alamofire

//Здесь заполняем параметры для запроса
enum NetworkProvider: UrlRequestBuilder {
    
    case showHeroes
    
    var patch: String {
        switch self {
        case .showHeroes:
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
        case .showHeroes:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .showHeroes:
            return .get
        }
    }
}
