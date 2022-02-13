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
    static func createInfoHeroesModule() -> UIViewController
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
        // Адаптер служит для отделения делегатов таблицы от основной вью. SOLID "Принцип инверсий зависимостей"
        let adapter = HeroesAdapter(model: presenter.model ?? HeroesModel(cards: nil), view: view)
        // Указываем для нашей вью Presenter и Adapter
        view.presenter = presenter
        view.adapter = adapter
        return view
    }

    static func createInfoHeroesModule() -> UIViewController {
        let view = InfoHeroesViewController()
        let presenter = InfoHeroesPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
