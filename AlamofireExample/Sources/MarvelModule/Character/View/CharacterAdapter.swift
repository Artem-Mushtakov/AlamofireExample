//
//  CharacterAdapter.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import UIKit

class CharacterAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    
    var model: CharacterModel

    // MARK: - Initial

    init(model: CharacterModel) {
        self.model = model
    }

    // MARK:  - Settings

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.createCellModel().keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.createCellModel()["Section\(section)"]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Нажата ячейка \(model.createCellModel()["Section\(indexPath.section)"]?[indexPath.row].title ?? "Отсутствует значение")")
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCellView", for: indexPath) as? CharacterBasicCellView
        else { return UITableViewCell() }
        let data = model.createCellModel()["Section\(indexPath.section)"]?[indexPath.row]
        cell.titleLabel.text = data?.title
        cell.iconImage.image = data?.image
        return cell
    }
}
