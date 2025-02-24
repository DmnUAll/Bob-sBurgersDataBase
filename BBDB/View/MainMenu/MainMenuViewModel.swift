//
//  MainMenuViewModel.swift
//  BBDB
//
//  Created by Илья Валито on 20.02.2025.
//

import SwiftData
import SwiftUI

extension MainMenuView {
    @Observable
    final class ViewModel {
        enum MenuSelection: String, CaseIterable {
            case characters = "Characters"
            case episodes = "Episodes"
            case nextDoorStores = "Next Door Stores"
            case pestControlTrucks = "Pest Control Trucks"
            case endCredits = "End Credits"
            case burgersOfTheDay = "Burgers Of The Day"
        }
        
        var menuRows: [MenuSelection] {
            MenuSelection.allCases
        }
        
        var menuSelection: MenuSelection = .characters
        
        var isLoading: Bool = true
        
        @MainActor
        func load(modelContext: ModelContext) {
            isLoading = true
            switch menuSelection {
            case .characters:
                loadCharacters(modelContext: modelContext)
            case .episodes:
                loadEpisodes(modelContext: modelContext)
            case .nextDoorStores:
                loadNextDoorStores(modelContext: modelContext)
            case .pestControlTrucks:
                loadPestControlTrucks(modelContext: modelContext)
            case .endCredits:
                loadEndCreditsSequences(modelContext: modelContext)
            case .burgersOfTheDay:
                loadBurgersOfTheDay(modelContext: modelContext)
            }
        }
        
        @MainActor
        func loadCharacters(modelContext: ModelContext) {
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
        
        @MainActor
        func loadEpisodes(modelContext: ModelContext) {
            if Date.episodesLastLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let episodes = await Networking.loadData(fromLink: .allEpisodes) ?? [] as Episodes
                    
                    try? modelContext.delete(model: Episode.self)

                    episodes.forEach { episode in
                        modelContext.insert(episode)
                    }
                    Date.episodesLastLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
        
        @MainActor
        func loadNextDoorStores(modelContext: ModelContext) {
            if Date.nextDoorStoresLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let nextDoorStores = await Networking.loadData(fromLink: .allNextDoorStores) ?? [] as NextDoorStores
                    
                    try? modelContext.delete(model: NextDoorStore.self)

                    nextDoorStores.forEach { nextDoorStore in
                        modelContext.insert(nextDoorStore)
                    }
                    Date.nextDoorStoresLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
        
        @MainActor
        func loadPestControlTrucks(modelContext: ModelContext) {
            if Date.pestControlTrucksLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let pestControlTrucks = await Networking.loadData(fromLink: .allPestControlTrucks) ?? [] as PestControlTrucks
                    
                    try? modelContext.delete(model: PestControlTruck.self)

                    pestControlTrucks.forEach { pestControlTruck in
                        modelContext.insert(pestControlTruck)
                    }
                    Date.pestControlTrucksLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
        
        @MainActor
        func loadEndCreditsSequences(modelContext: ModelContext) {
            if Date.endCreditsSequenceLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let endCreditsSequences = await Networking.loadData(fromLink: .allEndCreditsSequences) ?? [] as EndCreditsSequences
                    
                    try? modelContext.delete(model: EndCreditsSequence.self)

                    endCreditsSequences.forEach { endCreditSequence in
                        modelContext.insert(endCreditSequence)
                    }
                    Date.endCreditsSequenceLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
        
        @MainActor
        func loadBurgersOfTheDay(modelContext: ModelContext) {
            if Date.burgersOfTheDayLoadedDate.distance(to: .now) > 86400 {
                Task {
                    let burgersOfTheDat = await Networking.loadData(fromLink: .allBurgersOfTheDay) ?? [] as BurgersOfTheDay
                    
                    try? modelContext.delete(model: BurgerOfTheDay.self)

                    burgersOfTheDat.forEach { burgerOfTheDay in
                        modelContext.insert(burgerOfTheDay)
                    }
                    Date.burgersOfTheDayLoadedDate = .now
                    isLoading = false
                }
            } else {
                isLoading = false
            }
        }
    }
}
