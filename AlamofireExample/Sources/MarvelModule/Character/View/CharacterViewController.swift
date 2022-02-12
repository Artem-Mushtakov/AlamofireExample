//
//  CharacterViewController.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

class CharacterViewController: UIViewController {

    // MARK: - Properties

    // Объявляем Presenter для передачи из вью контроллера в Presenter.
    // Presenter инициализируем через сборщик модулей ModuleBuilder
    var presenter: ViewInputProtocol?

    //Объявляем адаптер для таблицы который подписан на Delegate и DataSource
    var adapter: CharacterAdapter?

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.register(CharacterBasicCellView.self, forCellReuseIdentifier: "BasicCellView")
        return tableView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marvel Character"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK:  - Settings

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// Делаем биндинг для связывания с вью

extension CharacterViewController: ViewOutputProtocol {
    func getGreeting(greeting: String) {
       /// self.greeting.text = greeting
    }
}
