//
//  HeroesAdapter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

// Адаптер для TableView

class HeroesAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties

    var model: HeroesModel
    var viewController: UIViewController
    var filteredData = [String]()
    var tableView = UITableView()
    var searchController = UISearchController()

    // MARK: - Initial

    init(model: HeroesModel, view: UIViewController) {
        self.model = model
        self.viewController = view
    }

    // MARK:  - Settings

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (searchController.isActive) {
              return filteredData.count
          } else {
              return model.cards?.count ?? 0
          }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = model.cards else { return }

        let detailImageHeroes = UIImageView()
        detailImageHeroes.load(urlString: data[indexPath.row].imageURL ?? "https://leso-torg.ru/upload/iblock/e51/xj69n7ks24dyrb2de2xq5ubtq1u0eri1.jpeg")

        let detailViewController = ModuleBuilder.createDetailHeroesModule(detailImageHeroes: detailImageHeroes)
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellView", for: indexPath) as? HeroesBasicCellView
        else { return UITableViewCell() }

        guard let data = model.cards else { return UITableViewCell() }

        if (searchController.isActive) {
            cell.headerLabel.text = filteredData[indexPath.row]
              return cell
          }
          else {
              cell.headerLabel.text = data[indexPath.row].name
              cell.label.text = "Нажми что бы посмотреть картинку!"
              return cell
          }
    }
}

extension HeroesAdapter: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let data = model.cards.map { $0.map { $0.name } }
        guard let tableData = data else { return }
        let array = (tableData as NSArray).filtered(using: searchPredicate)
        filteredData = array as! [String]

        self.tableView.reloadData()
    }
}
