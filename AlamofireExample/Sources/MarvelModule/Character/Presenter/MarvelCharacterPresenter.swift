//
//  CharacterPresenter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

// Протокол передачи из Вью
protocol ViewOutputProtocol: AnyObject {
    func getGreeting(greeting: String)
}

// Протокол передачи во вью
protocol ViewInputProtocol: AnyObject {

    init(view: ViewOutputProtocol, characterModel: CharacterModel)
    //func showGreeting()
}

class CharacterPresenter: ViewInputProtocol {

    let view: ViewOutputProtocol

    // Модель персонажей
    let characterModel: CharacterModel

    required init(view: ViewOutputProtocol, characterModel: CharacterModel) {
        self.view = view
        self.characterModel = characterModel
    }
}
