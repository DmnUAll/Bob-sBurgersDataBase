//
//  Character.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import Foundation

struct CartoonCharacter: Codable {
    let id: Int
    let name: String
    let relatives: [Relative]
    let wikiURL: String
    let image: String
    let gender: String?
    let hair, occupation: String?
    let allOccupations: [String]
    let firstEpisode, voicedBy: String?
    let url: String
    let age: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case relatives
        case wikiURL = "wikiUrl"
        case image
        case gender
        case hair
        case occupation
        case allOccupations
        case firstEpisode
        case voicedBy
        case url
        case age
    }
}

typealias Characters = [CartoonCharacter]
