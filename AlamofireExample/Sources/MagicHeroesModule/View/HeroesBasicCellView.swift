//
//  HeroesBasicCellView.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import Foundation

import UIKit

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

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Metric.labelFont
        return label
    } ()

    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        return image
    } ()

    // MARK:  - Settings

    private func setupHierarchy(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImage)
    }

    private func setupLayout() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension HeroesBasicCellView {

    enum Metric {
        static let labelFont: UIFont = .systemFont(ofSize: 17)
    }
}
