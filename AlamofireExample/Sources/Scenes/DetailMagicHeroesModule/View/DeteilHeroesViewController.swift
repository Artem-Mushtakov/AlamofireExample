//
//  DeteilHeroesViewController.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation
import UIKit

class DetailHeroesViewController: UIViewController {

    // MARK: - Properties

    var presenter: DetailHeroesViewInputProtocol?

    // MARK: - Views

    var detailImageHeroes: UIImageView = {
        var image = UIImageView()
        image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        //detailImageHeroes = (presenter?.detailImageHeroes) ?? UIImageView(image: .add)
    }

    // MARK:  - Settings

    private func setupHierarchy() {
        view.addSubview(detailImageHeroes)
    detailImageHeroes.center = view.center
    }

    func setupLayout() {
        detailImageHeroes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailImageHeroes.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImageHeroes.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension DetailHeroesViewController: DetailHeroesViewOutputProtocol {
    // Функция вызывается при успешном выполнении запроса
    func succes() {

    }
    // Функция вызывается при ошибки выполнении запроса
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
