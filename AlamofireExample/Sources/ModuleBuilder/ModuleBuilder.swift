//
//  ModuleBuilder.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

protocol Builder {
    static func createCharacterModule() -> UIViewController
}

// Сборщик модулей

class ModuleBuilder: Builder {
    static func createCharacterModule() -> UIViewController {
        let model = CharacterModel(firstName: "Alex", lastName: "Potyu")
        let view = CharacterViewController()
        let presenter = CharacterPresenter(view: view, character: model)
        view.presenter = presenter
        return view
    }
}
