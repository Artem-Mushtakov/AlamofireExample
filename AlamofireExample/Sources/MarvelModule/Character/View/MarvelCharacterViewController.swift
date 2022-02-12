//
//  CharacterViewController.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

class CharacterViewController: UIViewController {

 var greeting: UILabel!

    //  Объявляем презентер для передачи из вью контроллера в презентер.
    // Презентер инициализируем через сборщик модулей ModuleBuilder
    var presenter: ViewInputProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    func didTapButtonAction(_ sender: Any) {
        self.presenter?.showGreeting()
    }
}

// Делаем биндинг для связывания с вью

extension CharacterViewController: ViewOutputProtocol {
    func getGreeting(greeting: String) {
        self.greeting.text = greeting
    }
}
