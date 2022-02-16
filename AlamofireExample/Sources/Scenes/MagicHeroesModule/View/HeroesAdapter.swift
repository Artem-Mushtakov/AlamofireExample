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

        cell.headerLabel.text = data[indexPath.row].name
        cell.label.text = "Нажми что бы посмотреть картинку!"
        return cell
    }
}

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
