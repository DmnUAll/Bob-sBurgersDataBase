//
//  ContentViewViewModel.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var characters: Characters = []
        var isLoading: Bool = true
        
        init() {
            Task {
                self.characters = await Networking.loadData(fromLink: .allCharacters) ?? [] as Characters
                isLoading = false
            }
        }
    }
}
