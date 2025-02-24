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
        var isLoading: Bool = true
        
        @MainActor
        func load(modelContext: ModelContext) {
            if Date.charactersLastLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let characters = await Networking.loadData(fromLink: .allCharacters) ?? [] as Characters
                    
                    try? modelContext.delete(model: CartoonCharacter.self)

                    characters.forEach { character in
                        modelContext.insert(character)
                    }
                    Date.charactersLastLoadedDate = .now
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
