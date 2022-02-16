//
//  DetailHeroesPresenter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import UIKit
import Alamofire

class DetailHeroesPresenter: DetailHeroesViewInputProtocol {

    weak var view: DetailHeroesViewOutputProtocol?

    required init(view: DetailHeroesViewOutputProtocol) {
        self.view = view
    }
}

