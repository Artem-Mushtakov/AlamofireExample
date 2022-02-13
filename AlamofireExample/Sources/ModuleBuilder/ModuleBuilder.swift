//
//  ModuleBuilder.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

// Protocol для сборки модулей
protocol Builder {
    static func createMagicHeroesModule() -> UIViewController
}

// Class для сборки модулей
class ModuleBuilder: Builder {
    static func createMagicHeroesModule() -> UIViewController {
        let networkService = ServiceProvider<NetworkProvider>()
        let view = HeroesViewController()
        let presenter = HeroesPresenter(view: view, networkService: networkService)
        let adapter = HeroesAdapter(model: presenter.data ?? HeroesModel(cards: nil))
        view.presenter = presenter
        view.adapter = adapter
        return view
    }
}
