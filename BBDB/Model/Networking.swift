//
//  Networking.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import Foundation
import SwiftUI

struct Networking {
    enum Link: String {
        case allCharacters = "https://bobsburgers-api.herokuapp.com/characters/"
    }
    
    private init() { }
    
    static func loadData<T: Decodable>(fromLink link: Link) async -> [T]? {
        guard let url = URL(string: link.rawValue) else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([T].self, from: data) {
                return decodedResponse
            }
        } catch {
            print("Error catched: \(error.localizedDescription)")
        }
        
        return nil
    }
}

#Preview {
    ContentView()
}
