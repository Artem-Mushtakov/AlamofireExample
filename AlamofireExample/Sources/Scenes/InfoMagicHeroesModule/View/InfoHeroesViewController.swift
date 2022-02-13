//
//  InfoHeroesViewController.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation
import UIKit

class InfoHeroesViewController: UIViewController {

    // MARK: - Properties

    var presenter: InfoHeroesViewInputProtocol?

    // MARK: - Views

    private lazy var infoImageHeroes: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: .add)
        image.layer.cornerRadius = 10
        return image
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupHierarchy()
        setupLayout()
    }

    // MARK:  - Settings

    private func setupHierarchy() {
        view.addSubview(infoImageHeroes)
    }

    func setupLayout() {
        infoImageHeroes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoImageHeroes.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoImageHeroes.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// Подписываемся под ViewOutputProtocol для связывания вью и презентора

extension InfoHeroesViewController: InfoHeroesViewOutputProtocol {
    // Функция вызывается при успешном выполнении запроса
    func succes() {
        print("Запрос Complete")
    }
    // Функция вызывается при ошибки выполнении запроса
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
