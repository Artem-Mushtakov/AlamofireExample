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

    init(view: ViewOutputProtocol, character: CharacterModel)
    func showGreeting()
}

class CharacterPresenter: ViewInputProtocol {

    let view: ViewOutputProtocol

    // Модель персонажей
    let character: CharacterModel

    required init(view: ViewOutputProtocol, character: CharacterModel) {
        self.view = view
        self.character = character
    }

    func showGreeting() {
        let greeting = character.lastName + " " + character.firstName
        self.view.getGreeting(greeting: greeting )
    }
}
