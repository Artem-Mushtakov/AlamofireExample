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

    lazy var detailImageHeroes: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK:  - Settings

    private func setupHierarchy() {
        view.addSubview(detailImageHeroes)
    }

    private func setupLayout() {
        detailImageHeroes.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailImageHeroes.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailImageHeroes.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailImageHeroes.widthAnchor.constraint(equalToConstant: 400),
            detailImageHeroes.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
}

extension DetailHeroesViewController: DetailHeroesViewOutputProtocol {

    func succes() {
        print("succes")
    }

    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
