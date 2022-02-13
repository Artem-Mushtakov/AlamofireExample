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
        return model.cards?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = model.cards
        print(data?[indexPath.row].name ?? "")
        tableView.deselectRow(at: indexPath, animated: true)

        let infoViewController = ModuleBuilder.createInfoHeroesModule()
        viewController.navigationController?.pushViewController(infoViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellView", for: indexPath) as? HeroesBasicCellView
        else { return UITableViewCell() }

        guard let data = model.cards else { return UITableViewCell() }

        cell.headerLabel.text = data[indexPath.row].name
        cell.label.text = "Нажми что бы посмотреть картинку!"
        return cell
    }
}
