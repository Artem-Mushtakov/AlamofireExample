//
//  ModuleBuilder.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

protocol Builder {
    static func createMarvelCharacterModule() -> UIViewController
}

// Сборщик модулей

class ModuleBuilder: Builder {
    static func createMarvelCharacterModule() -> UIViewController {
        let model = CharacterModel()
        let view = CharacterViewController()
        let presenter = CharacterPresenter(view: view, characterModel: model)
        let adapter = CharacterAdapter(model: model)
        view.presenter = presenter
        view.adapter = adapter
        return view
    }
}
