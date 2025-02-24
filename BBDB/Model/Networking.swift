//
//  Networking.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import Foundation

struct Networking {
    enum Link: String {
        case allCharacters = "https://bobsburgers-api.herokuapp.com/characters/"
        case allEpisodes = "https://bobsburgers-api.herokuapp.com/episodes/"
        case allNextDoorStores = "https://bobsburgers-api.herokuapp.com/storeNextDoor/"
        case allPestControlTrucks = "https://bobsburgers-api.herokuapp.com/pestControlTruck/"
        case allEndCreditsSequences = "https://bobsburgers-api.herokuapp.com/endCreditsSequence/"
        case allBurgersOfTheDay = "https://bobsburgers-api.herokuapp.com/burgerOfTheDay/"
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
