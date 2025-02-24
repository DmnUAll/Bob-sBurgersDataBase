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
            let nextDoorStoreConfig = ModelConfiguration("nextDoorStoreDatabase", schema: Schema([NextDoorStore.self]))
            let pestControlTruckConfig = ModelConfiguration("pestControlTruckDatabase", schema: Schema([PestControlTruck.self]))
            let endCreditsSequenceConfig = ModelConfiguration("endCreditsSequenceDatabase", schema: Schema([EndCreditsSequence.self]))
            let burgerOfTheDayConfig = ModelConfiguration("burgerOfTheDayDatabase", schema: Schema([BurgerOfTheDay.self]))

            
            container = try ModelContainer(
                for: CartoonCharacter.self, Episode.self, NextDoorStore.self, PestControlTruck.self, EndCreditsSequence.self, BurgerOfTheDay.self,
                configurations: characterConfig, episodeConfig, nextDoorStoreConfig, pestControlTruckConfig, endCreditsSequenceConfig, burgerOfTheDayConfig
            )
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
