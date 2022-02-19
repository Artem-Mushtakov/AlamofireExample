//
//  ServiceProvider.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Alamofire

// Енам который возвращается после выполнения запроса. Возвращает все ок case success, ошибка failure.
enum Result<T: Codable> {
    case success(T)
    case failure(Error)
}

// Класс формирует запрос, подписываемся под протокол UrlRequestBuilder, для конформа под наш запрос.
class ServiceProvider<T: UrlRequestBuilder> {
    
    func load<U: Codable>(service: T, decodeType: U.Type, completion: @escaping (Result<U>) -> Void) {
        guard let ursRequest = service.urlRequest else { return }

        AF.request(ursRequest).responseDecodable(of: U.self) { (response) in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
