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

    // MARK: - Initial

    init(model: HeroesModel) {
        self.model = model
    }

    // MARK:  - Settings

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.cards?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model.cards.map { $0.map { $0.name } } ?? 0)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellView", for: indexPath) as? HeroesBasicCellView
        else { return UITableViewCell() }
        let data = model.cards?.compactMap({ text in
            return text.name
        })
        cell.titleLabel.text = data?[indexPath.row]
        return cell
    }
}
