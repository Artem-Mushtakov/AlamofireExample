//
//  HeroesBasicCellView.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import Foundation

import UIKit

// Базовая ячейка таблицы

class HeroesBasicCellView: UITableViewCell {

    // MARK: - Initial

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Views

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = Metric.labelFont
        return label
    } ()

    lazy var label: UILabel = {
        let label = UILabel()
        return label
    } ()

    // MARK:  - Settings

    private func setupHierarchy(){
        contentView.addSubview(headerLabel)
        contentView.addSubview(label)
    }
    
    private func setupLayout() {

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: Metric.contentViewHeightAnchor),
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: Metric.headerCenterYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Metric.labelTopAnchor)
        ])
    }
}

extension HeroesBasicCellView {

    enum Metric {
        static let labelFont: UIFont = .boldSystemFont(ofSize: 17)
        static let contentViewHeightAnchor: CGFloat = 80
        static let headerCenterYAnchor: CGFloat = -15
        static let labelTopAnchor: CGFloat = 5
    }
}
