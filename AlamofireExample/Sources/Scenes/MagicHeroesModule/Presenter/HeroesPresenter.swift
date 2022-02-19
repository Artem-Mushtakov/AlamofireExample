//
//  HeroesPresenter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit
import Alamofire

class HeroesPresenter: HeroesViewInputProtocol {

    let networkService: ServiceProvider<NetworkProvider>
    weak var view: HeroesViewOutputProtocol?
    var model: HeroesModel?
    // Инициализатор который используется в ModuleBuilder для конфигурации Presenter
    required init(view: HeroesViewOutputProtocol, networkService: ServiceProvider<NetworkProvider>) {
        self.view = view
        self.networkService = networkService
        getData()
    }

    func getData() {
        networkService.load(service: .showHeroes, decodeType: HeroesModel.self) { [weak self] result in
            guard let self = self else { return }
            print(result)

            // Вызываем асинхронно с main потоком, что бы в случае задержки запроса, не было зависания UI.
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.model = model
                    // Вызов функции view при успешном запросе
                    self.view?.succes()
                    print(model)
                case .failure(let error):
                    // Вызов функции view при Ошибке запросе
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
