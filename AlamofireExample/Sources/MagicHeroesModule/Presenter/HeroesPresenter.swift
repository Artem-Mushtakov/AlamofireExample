//
//  HeroesPresenter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit
import Alamofire

// Протокол передачи из Вью
protocol ViewOutputProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

// Протокол передачи во вью
protocol ViewInputProtocol: AnyObject {

    init(view: ViewOutputProtocol, networkService: ServiceProvider<NetworkProvider>)
    func getData()
    var data: HeroesModel? { get set }
}

class HeroesPresenter: ViewInputProtocol {

    weak var view: ViewOutputProtocol?
    let networkService: ServiceProvider<NetworkProvider>
    var data: HeroesModel?

    required init(view: ViewOutputProtocol, networkService: ServiceProvider<NetworkProvider>) {
        self.view = view
        self.networkService = networkService
        getData()
    }

    func getData() {
        networkService.load(service: .showCharacters, decodeType: HeroesModel.self) { [weak self] result in
            guard let self = self else { return }
            print(result)
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.data = data
                    self.view?.succes()
                    print(data)
                case .failure(let error):
                    print("Error ОШИБКА")
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
