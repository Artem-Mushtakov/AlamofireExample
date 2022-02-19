//
//  URLRequestBuilder.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation
import Alamofire

/// Создаем протокол для конфигурации запросов.
/// - parameter baseUrl - Базовый URL
/// - parameter path - Путь до Json
/// - parameter headers - Заголовок запроса
/// - parameter parameters - Параметры запроса
/// - parameter method - Тип запроса

protocol UrlRequestBuilder: URLRequestConvertible {
    var baseUrl: String { get }
    var patch: String { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
}


extension UrlRequestBuilder {
    
    // Базовый URL
    var baseUrl: String {
        return "https://api.magicthegathering.io/"
    }

    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()

        // Указываем весь путь запроса
        var request = URLRequest(url: url.appendingPathComponent(patch))
        request.httpMethod = method.rawValue

        // Задаем значения для поля заголовка
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        switch method {

        // У нас только GET запрос, поэтому добавляем для него Заголовок и Параметры. Так же можно добавить .POST и тд.
        case .get:
            request.allHTTPHeaderFields = headers?.dictionary
            request = try URLEncoding.default.encode(request, with: parameters)
        default:
            break
        }
        return request
    }
}
