//
//  CharacterBasicCellView.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import Foundation

import UIKit

class CharacterBasicCellView: UITableViewCell {

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
        iconImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            contentView.heightAnchor.constraint(equalToConstant: Metric.contentViewHeightAnchor),

            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.iconImageLeadingAnchorConstant),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: Metric.iconImageWidthAnchorConstant),
            iconImage.heightAnchor.constraint(equalToConstant: Metric.iconImageHeightAnchorConstant),

            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: Metric.titleLabelLeadingAnchorConstant),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension CharacterBasicCellView {

    enum Metric {
        static let labelFont: UIFont = .systemFont(ofSize: 17)
        static let contentViewHeightAnchor: CGFloat = 60
        static var titleLabelLeadingAnchorConstant: CGFloat = 16
        static var iconImageLeadingAnchorConstant: CGFloat = 16
        static var iconImageWidthAnchorConstant: CGFloat = 30
        static var iconImageHeightAnchorConstant: CGFloat = 30
    }
}
