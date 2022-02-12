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
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    } ()

    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        return image
    } ()

    // MARK:  - Settings

    private func setupHierarchy(){
        addSubview(titleLabel)
        addSubview(iconImage)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = CGColor.init(gray: 10, alpha: 1)
    }

    private func setupLayout() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.iconImageLeadingAnchorConstant),
            iconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: Metric.iconImageWidthAnchorConstant),
            iconImage.heightAnchor.constraint(equalToConstant: Metric.iconImageHeightAnchorConstant),

            titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: Metric.titleLabelLeadingAnchorConstant),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: Metric.titleLabelWidthAnchor),
            self.heightAnchor.constraint(equalToConstant: Metric.titleLabelHeightAnchor)
        ])
    }
}

extension CharacterBasicCellView {

    enum Metric {
        static let labelFont: UIFont = .systemFont(ofSize: 17)

        static var titleLabelLeadingAnchorConstant: CGFloat = 16
        static var titleLabelWidthAnchor: CGFloat = 50
        static var titleLabelHeightAnchor: CGFloat = 80
        static var iconImageLeadingAnchorConstant: CGFloat = 16
        static var iconImageWidthAnchorConstant: CGFloat = 50
        static var iconImageHeightAnchorConstant: CGFloat = 50
    }
}
