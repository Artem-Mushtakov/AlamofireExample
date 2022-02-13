//
//  MagicModel.swift
//  AlamofireExample
//
//  Created by Artem Mushtakov on 13.02.2022.
//

import Foundation

// MARK: - Magic

struct HeroesModel: Codable {
    let cards: [Card]?
}

// MARK: - Card

struct Card: Codable {
    let name, manaCost: String?
    let colors: [Color]?
    let colorIdentity: [ColorIdentity]?
    let imageURL: String?
    let variations: [String]?
    let foreignNames: [ForeignName]?
    let rulings: [Ruling]?
    let supertypes: [String]?

    enum CodingKeys: String, CodingKey {
        case name, manaCost, colors, colorIdentity
        case imageURL = "imageUrl"
        case variations, foreignNames, rulings, supertypes
    }
}

enum ColorIdentity: String, Codable {
    case b = "B"
    case u = "U"
    case w = "W"
}

enum Color: String, Codable {
    case black = "Black"
    case blue = "Blue"
    case white = "White"
}

// MARK: - ForeignName

struct ForeignName: Codable {
    let name, text, type: String?
    let flavor: String?
    let imageURL: String?
    let language: Language?
    let multiverseid: Int?

    enum CodingKeys: String, CodingKey {
        case name, text, type, flavor
        case imageURL = "imageUrl"
        case language, multiverseid
    }
}

enum Language: String, Codable {
    case chineseSimplified = "Chinese Simplified"
    case french = "French"
    case german = "German"
    case italian = "Italian"
    case japanese = "Japanese"
    case portugueseBrazil = "Portuguese (Brazil)"
    case russian = "Russian"
    case spanish = "Spanish"
}

// MARK: - Ruling

struct Ruling: Codable {
    let date, text: String?
}
