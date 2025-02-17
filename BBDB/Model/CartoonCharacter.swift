//
//  CartoonCharacter.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import Foundation
import SwiftData

@Model
final class CartoonCharacter: Codable {
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
        case isFavorite
    }
    
    var id: Int
    var name: String
    var relatives: [Relative]
    var wikiURL: String
    var image: String
    var gender: String?
    var hair: String?
    var occupation: String?
    var allOccupations: [String]
    var firstEpisode: String?
    var voicedBy: String?
    var url: String
    var age: String?
    var isFavorite: Bool?
    
    init(
        id: Int,
        name: String,
        relatives: [Relative],
        wikiURL: String,
        image: String,
        gender: String? = nil,
        hair: String? = nil,
        occupation: String? = nil,
        allOccupations: [String],
        firstEpisode: String? = nil,
        voicedBy: String? = nil,
        url: String,
        age: String? = nil,
        isFavorite: Bool? = false
    ) {
        self.id = id
        self.name = name
        self.relatives = relatives
        self.wikiURL = wikiURL
        self.image = image
        self.gender = gender
        self.hair = hair
        self.occupation = occupation
        self.allOccupations = allOccupations
        self.firstEpisode = firstEpisode
        self.voicedBy = voicedBy
        self.url = url
        self.age = age
        self.isFavorite = isFavorite
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.relatives = try container.decode([Relative].self, forKey: .relatives)
        self.wikiURL = try container.decode(String.self, forKey: .wikiURL)
        self.image = try container.decode(String.self, forKey: .image)
        self.gender = try? container.decode(String.self, forKey: .gender)
        self.hair = try? container.decode(String.self, forKey: .hair)
        self.occupation = try? container.decode(String.self, forKey: .occupation)
        self.allOccupations = try container.decode([String].self, forKey: .allOccupations)
        self.firstEpisode = try? container.decode(String.self, forKey: .firstEpisode)
        self.voicedBy = try? container.decode(String.self, forKey: .voicedBy)
        self.url = try container.decode(String.self, forKey: .url)
        self.age = try? container.decode(String.self, forKey: .age)
        self.isFavorite = try? container.decode(Bool.self, forKey: .isFavorite)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.relatives, forKey: .relatives)
        try container.encode(self.wikiURL, forKey: .wikiURL)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.gender, forKey: .gender)
        try container.encode(self.hair, forKey: .hair)
        try container.encode(self.occupation, forKey: .occupation)
        try container.encode(self.allOccupations, forKey: . allOccupations)
        try container.encode(self.firstEpisode, forKey: .firstEpisode)
        try container.encode(self.voicedBy, forKey: .voicedBy)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.isFavorite, forKey: .isFavorite)
    }
}

typealias Characters = [CartoonCharacter]

extension CartoonCharacter {
    static let example = CartoonCharacter(
        id: 666,
        name: "Rusty Shackleford",
        relatives: [
            Relative(
                id: "777",
                name: "Dale Gribble",
                relationship: "Secretary",
                wikiURL: "https://static.wikia.nocookie.net/kingofthehill/images/a/a7/Dale_Gribble.png/revision/latest/zoom-crop/width/280/height/160?cb=20131231145446",
                url: "https://kingofthehill.fandom.com/wiki/Rusty_Shackleford_(Real)"
            ),
            Relative(
                id: "888",
                name: "Nancy Gribble",
                relationship: "Wife",
                wikiURL: "https://static.wikia.nocookie.net/kingofthehill/images/a/a7/Dale_Gribble.png/revision/latest/zoom-crop/width/280/height/160?cb=20131231145446",
                url: "https://kingofthehill.fandom.com/wiki/Rusty_Shackleford_(Real)"
            ),
            Relative(
                id: "999",
                name: "Joseph Gribble",
                relationship: "Son",
                wikiURL: "https://static.wikia.nocookie.net/kingofthehill/images/a/a7/Dale_Gribble.png/revision/latest/zoom-crop/width/280/height/160?cb=20131231145446",
                url: "https://kingofthehill.fandom.com/wiki/Rusty_Shackleford_(Real)"
            )
        ],
        wikiURL: "https://kingofthehill.fandom.com/wiki/Rusty_Shackleford_(Real)",
        image: "https://static.wikia.nocookie.net/kingofthehill/images/a/a7/Dale_Gribble.png/revision/latest/zoom-crop/width/280/height/160?cb=20131231145446",
        gender: "Male",
        hair: "Bald",
        occupation: "Cowboy",
        allOccupations: ["Secret agent", "Bug killer"],
        firstEpisode: "S01E01",
        voicedBy: "Me Lol Kek",
        url: "https://static.wikia.nocookie.net/kingofthehill/images/a/a7/Dale_Gribble.png/revision/latest/zoom-crop/width/280/height/160?cb=20131231145446",
        age: "66",
        isFavorite: true
    )
}
