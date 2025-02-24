//
//  NextDoorStore.swift
//  BBDB
//
//  Created by Илья Валито on 24.02.2025.
//

import Foundation
import SwiftData

@Model
class NextDoorStore: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case season
        case episode
        case episodeURL = "episodeUrl"
        case url
    }
    
    var id: Int
    var name: String
    var image: String
    var season: Int
    var episode: Int
    var episodeURL: String
    var url: String

    init(
        id: Int,
        name: String,
        image: String,
        season: Int,
        episode: Int,
        episodeURL: String,
        url: String
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.season = season
        self.episode = episode
        self.episodeURL = episodeURL
        self.url = url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.season = try container.decode(Int.self, forKey: .season)
        self.episode = try container.decode(Int.self, forKey: .episode)
        self.episodeURL = try container.decode(String.self, forKey: .episodeURL)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.season, forKey: .season)
        try container.encode(self.episode, forKey: .episode)
        try container.encode(self.episodeURL, forKey: .episodeURL)
        try container.encode(self.url, forKey: .url)
    }
}

typealias NextDoorStores = [NextDoorStore]
