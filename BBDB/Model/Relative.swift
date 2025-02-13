//
//  Relative.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import Foundation

struct Relative: Codable {
    let id: String
    let name: String
    let relationship: String?
    let wikiURL: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case relationship
        case wikiURL = "wikiUrl"
        case url
    }
}
