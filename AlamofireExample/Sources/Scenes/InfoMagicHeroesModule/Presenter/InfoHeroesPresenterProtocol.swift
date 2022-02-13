//
//  InfoHeroesPresenterProtocol.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation
import UIKit

// Протокол передачи из Вью
protocol InfoHeroesViewOutputProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

// Протокол передачи во вью
protocol InfoHeroesViewInputProtocol: AnyObject {
    init(view: InfoHeroesViewOutputProtocol)
}
