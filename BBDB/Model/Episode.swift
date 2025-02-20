//
//  Episode.swift
//  BBDB
//
//  Created by Илья Валито on 20.02.2025.
//

import Foundation
import SwiftData

@Model
class Episode: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case episodeDescription
        case productionCode
        case airDate
        case season
        case episode
        case totalViewers
        case url
        case wikiURL = "wikiUrl"
    }
    
    var id: Int
    var name: String
    var episodeDescription: String
    var productionCode: String
    var airDate: String
    var season: Int
    var episode: Int
    var totalViewers: String
    var url: String
    var wikiURL: String

    init(
        id: Int,
        name: String,
        episodeDescription: String,
        productionCode: String,
        airDate: String,
        season: Int,
        episode: Int,
        totalViewers: String,
        url: String,
        wikiURL: String
    ) {
        self.id = id
        self.name = name
        self.episodeDescription = episodeDescription
        self.productionCode = productionCode
        self.airDate = airDate
        self.season = season
        self.episode = episode
        self.totalViewers = totalViewers
        self.url = url
        self.wikiURL = wikiURL
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.episodeDescription = try container.decode(String.self, forKey: .episodeDescription)
        self.productionCode = try container.decode(String.self, forKey: .productionCode)
        self.airDate = try container.decode(String.self, forKey: .airDate)
        self.season = try container.decode(Int.self, forKey: .season)
        self.episode = try container.decode(Int.self, forKey: .episode)
        self.totalViewers = try container.decode(String.self, forKey: .totalViewers)
        self.url = try container.decode(String.self, forKey: .url)
        self.wikiURL = try container.decode(String.self, forKey: .wikiURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.episodeDescription, forKey: .episodeDescription)
        try container.encode(self.productionCode, forKey: .productionCode)
        try container.encode(self.airDate, forKey: .airDate)
        try container.encode(self.season, forKey: .season)
        try container.encode(self.episode, forKey: .episode)
        try container.encode(self.totalViewers, forKey: .totalViewers)
        try container.encode(self.url, forKey: . url)
        try container.encode(self.wikiURL, forKey: .wikiURL)
    }
}

typealias Episodes = [Episode]
