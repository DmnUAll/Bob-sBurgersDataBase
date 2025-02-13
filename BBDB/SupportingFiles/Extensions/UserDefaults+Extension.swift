//
//  UserDefaults+Extension.swift
//  BBDB
//
//  Created by Илья Валито on 13.02.2025.
//

import Foundation

extension UserDefaults {
    enum UDKey: String {
        case lastLoadedDate
    }
    
    static func saveData<T: Encodable>(_ data: T, withKey key: UDKey) {
        guard let encoded = try? JSONEncoder().encode(data) else {
            fatalError("Failed to encode data for \(key.rawValue).")
        }
        
        self.standard.set(encoded, forKey: key.rawValue)
    }
    
    static func loadData<T: Decodable>(withKey key: UDKey) -> T {
        guard let data = self.standard.data(forKey: key.rawValue) else {
            return "" as! T
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode data due to missing key '\(key)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode data due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode data due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode data because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode data: \(error.localizedDescription)")
        }
    }
}
