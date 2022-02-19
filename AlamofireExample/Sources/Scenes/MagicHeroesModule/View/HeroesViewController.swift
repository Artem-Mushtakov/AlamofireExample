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
    private var filteredData = [String]()

    // MARK: - Views

    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        navigationItem.searchController = searchController
        return searchController
    } ()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
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
        tableView.reloadData()
    }
    
    // MARK:  - Settings
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK:  - TableView Delegate

extension HeroesViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataCount = presenter?.model?.cards else { return 0 }
        return searchController.isActive ? (filteredData.count) : (dataCount.count)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = presenter?.model?.cards else { return }

        let detailImageHeroes = UIImageView()
        detailImageHeroes.load(urlString: data[indexPath.row].imageURL ?? "https://leso-torg.ru/upload/iblock/e51/xj69n7ks24dyrb2de2xq5ubtq1u0eri1.jpeg")

        let detailViewController = ModuleBuilder.createDetailHeroesModule(detailImageHeroes: detailImageHeroes)
        navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let data = presenter?.model?.cards else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellView",
                                                       for: indexPath) as? HeroesBasicCellView else { return UITableViewCell() }

        if (searchController.isActive) {
            cell.headerLabel.text = filteredData[indexPath.row]
            return cell
        } else {
            cell.headerLabel.text = data[indexPath.row].name
            cell.label.text = "Нажми что бы посмотреть картинку!"
            return cell
        }
    }
}

// MARK:  - Search Results Updating

extension HeroesViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let data = presenter?.model?.cards else { return }
        let tableData = data.map { $0.name }
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text ?? "")

        filteredData.removeAll(keepingCapacity: false)

        let array = (tableData as NSArray).filtered(using: searchPredicate)
        filteredData = array as? [String] ?? []

        self.tableView.reloadData()
    }
}

// MARK:  - OutPut Protocol

extension HeroesViewController: HeroesViewOutputProtocol {
    // Функция вызывается при успешном выполнении запроса

    func succes() {
        tableView.reloadData()
    }
    // Функция вызывается при ошибки выполнении запроса
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
