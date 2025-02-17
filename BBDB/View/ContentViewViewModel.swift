//
//  ContentViewViewModel.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import SwiftData
import SwiftUI

extension ContentView {
    @Observable
    final class ViewModel {
        private var lastLoadedDate: Date {
            get {
                let dateString = UserDefaults.loadData(withKey: .lastLoadedDate) as String
                if dateString.isEmpty {
                    return Date.distantPast
                } else {
                    return Date.convertStringToDate(dateString)
                }
            }
            set {
                let dateString = newValue.convertDateToString()
                UserDefaults.saveData(dateString, withKey: .lastLoadedDate)
            }
        }
        
        var isLoading: Bool = true
        
        @MainActor
        func load(modelContext: ModelContext) {
            if lastLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let characters = await Networking.loadData(fromLink: .allCharacters) ?? [] as Characters
                    
                    try? modelContext.delete(model: CartoonCharacter.self)

                    characters.forEach { character in
                        modelContext.insert(character)
                    }
                    lastLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
