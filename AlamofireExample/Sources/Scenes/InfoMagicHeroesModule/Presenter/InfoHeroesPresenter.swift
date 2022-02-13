//
//  InfoHeroesPresenter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import UIKit
import Alamofire

class InfoHeroesPresenter: InfoHeroesViewInputProtocol {

    weak var view: InfoHeroesViewOutputProtocol?

    required init(view: InfoHeroesViewOutputProtocol) {
        self.view = view
    }
}

