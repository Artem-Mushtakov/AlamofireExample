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
    static func createDetailHeroesModule(detailImageHeroes: UIImageView) -> UIViewController
}

// Class для сборки модулей
class ModuleBuilder: Builder {
    static func createMagicHeroesModule() -> UIViewController {
        // Сетевой слой
        let networkService = ServiceProvider<NetworkProvider>()
        // Вью
        let view = HeroesViewController()
        // Презентер
        let presenter = HeroesPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }

    static func createDetailHeroesModule(detailImageHeroes: UIImageView) -> UIViewController {
        let view = DetailHeroesViewController()
        let presenter = DetailHeroesPresenter(view: view)
        view.presenter = presenter
        view.detailImageHeroes = detailImageHeroes
        return view
    }
}
