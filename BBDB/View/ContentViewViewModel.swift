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
    class ViewModel {
        
        var isLoading: Bool = true
        
        func load(_ modelContext: ModelContext) {
            Task {
                let loadedCharacters = await Networking.loadData(fromLink: .allCharacters) ?? [] as Characters
                loadedCharacters.forEach { character in
                    modelContext.insert(character)
                }
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
