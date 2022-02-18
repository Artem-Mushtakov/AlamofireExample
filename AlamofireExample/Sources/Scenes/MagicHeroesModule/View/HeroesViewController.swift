//
//  HeroesViewController.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit
import Alamofire

class HeroesViewController: UIViewController {
    
    // MARK: - Properties
    
    // Объявляем Presenter для передачи из вью контроллера в Presenter.
    // Presenter инициализируем через сборщик модулей ModuleBuilder
    var presenter: HeroesViewInputProtocol?
    //Объявляем адаптер для таблицы который подписан на Delegate и DataSource
    // Adapter инициализируем через сборщик модулей ModuleBuilder
    var adapter: HeroesAdapter?
    
    // MARK: - Views

    let filteredData = [String]()
    var searchController = UISearchController()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.backgroundColor = .white
        tableView.register(HeroesBasicCellView.self, forCellReuseIdentifier: "BasicCellView")
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Magic Heroes 🌯"
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()

        searchController = ({
                let controller = UISearchController(searchResultsController: nil)
                controller.searchResultsUpdater = adapter
                controller.searchBar.sizeToFit()

            navigationItem.searchController = controller

                return controller
            })()
        tableView.reloadData()
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

// Подписываемся под ViewOutputProtocol для связывания вью и презентора

extension HeroesViewController: HeroesViewOutputProtocol {
    // Функция вызывается при успешном выполнении запроса
    func succes() {
       adapter?.model = presenter?.model ?? HeroesModel(cards: nil)
        adapter?.filteredData = filteredData
        adapter?.viewController = self
        adapter?.searchController = searchController
        adapter?.tableView = tableView
        tableView.reloadData()
    }
    // Функция вызывается при ошибки выполнении запроса
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
