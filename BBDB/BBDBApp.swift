//
//  BBDBApp.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftData
import SwiftUI

@main
struct BBDBApp: App {
    var container: ModelContainer
    init() {
        do {
            let characterConfig = ModelConfiguration("characterDatabase", schema: Schema([CartoonCharacter.self]))
            let episodeConfig = ModelConfiguration("episodeDatabase", schema: Schema([Episode.self]))
            
            container = try ModelContainer(
                for: CartoonCharacter.self, Episode.self,
                configurations: characterConfig, episodeConfig
            )
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CartoonCharacter.self)
    }
}
