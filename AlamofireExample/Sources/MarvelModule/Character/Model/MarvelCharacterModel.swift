//
//  CharacterModel.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 12.02.2022.
//

import Foundation
import UIKit

enum CellType {
    case basicCell
    case cellTableSwitch
    case cellTableRightLabel
}

struct Cell {
    let type: CellType
    var image: UIImage
    let title: String
    var rightLabel: String?
}

final class CharacterModel {

    func createCellModel() -> [String: [Cell]] {

        return [ "Section0": [
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withTintColor(.green, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Сотовая связь"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(named: "personalhotspot")?.withTintColor(.green, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Режим модема")],
                 "Section1": [Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "dot.square.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Уведомления"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "speaker.wave.2.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Звуки, тактильные сигналы"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "moon.fill")?.withTintColor(.purple, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Не беспокоить"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "hourglass")?.withTintColor(.purple, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Экранное время")],
                 "Section2": [Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "gear")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Основные"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "switch.2")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Пункт управления"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "textformat.size")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Экран и яркость"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "switch.2")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Экран «Домой»"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "person.crop.square.fill")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Универсальный доступ"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(named: "wallpers") ?? .add,
                                title: "Обои"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(named: "siri") ?? .add,
                                title: "Siri и Поиск"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "faceid")?.withTintColor(.green, renderingMode: .alwaysOriginal) ?? .add,
                                title: "Face ID и код-пароль"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(named: "sos") ?? .add,
                                title: "Экстренный вызов - SOS"),
                              Cell(
                                type: .basicCell,
                                image: UIImage(systemName: "sun.min.fill") ?? .add,
                                title: "Уведомление о контакте")]
        ]
    }
}
