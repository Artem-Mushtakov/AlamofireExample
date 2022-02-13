//
//  HeroesPresenterProtocol.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation

// Протокол передачи из Вью
protocol HeroesViewOutputProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

// Протокол передачи во вью
protocol HeroesViewInputProtocol: AnyObject {

    init(view: HeroesViewOutputProtocol, networkService: ServiceProvider<NetworkProvider>)
    func getData()
    var model: HeroesModel? { get set }
}
