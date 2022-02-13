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
        // Сетевой слой
        let networkService = ServiceProvider<NetworkProvider>()
        // Вью
        let view = HeroesViewController()
        // Презентер
        let presenter = HeroesPresenter(view: view, networkService: networkService)
        // Адаптер служит для отделения делегатов таблицы от основной вью. SOLID "Принцип инверсий зависимостей"
        let adapter = HeroesAdapter(model: presenter.data ?? HeroesModel(cards: nil))
        // Указываем для нашей вью Presenter и Adapter
        view.presenter = presenter
        view.adapter = adapter
        return view
    }
}
