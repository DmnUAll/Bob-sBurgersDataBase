//
//  MainMenuView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftData
import SwiftUI

struct MainMenuView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var characters: Characters
    @Query private var episodes: Episodes
    @Query private var nextDoorStores: NextDoorStores
    @Query private var pestControlTrucks: PestControlTrucks
    @Query private var endCreditsSequences: EndCreditsSequences
    @Query private var burgersOfTheDay: BurgersOfTheDay


    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbBlue,
                    backgroundImage: .blueBackground,
                    titleText: Text("Main Menu")
                )
                
                VStack {
                    Menu {
                        Picker(selection: $viewModel.menuSelection, label: Text("Category Selection")) {
                            ForEach(viewModel.menuRows, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                    label: {
                        Label(viewModel.menuSelection.rawValue, systemImage: "chevron.down.circle.fill")
                    }
                    .onChange(of: viewModel.menuSelection) { _, _ in
                        viewModel.load(modelContext: modelContext)
                    }
                    
                    switch viewModel.menuSelection {
                    case .characters:
                        List(characters) {character in
                            Text(character.name)
                        }
                    case .episodes:
                        List(episodes) {episode in
                            Text(episode.name)
                        }
                        
                    case .nextDoorStores:
                        List(nextDoorStores) {nextDoorStore in
                            Text(nextDoorStore.name)
                        }
                    case .pestControlTrucks:
                        List(pestControlTrucks) {pestControlTruck in
                            Text(pestControlTruck.name)
                        }
                    case .endCredits:
                        List(endCreditsSequences) {endCreditSequence in
                            Text(endCreditSequence.image)
                        }
                    case .burgersOfTheDay:
                        List(burgersOfTheDay) {burgerOfTheDay in
                            Text(burgerOfTheDay.name)
                        }
                    }
                }
                .containerRelativeFrame(.horizontal)
                
                //                Menu {
                //                    Picker(selection: sortSelection, label: Text("Category Selection")) {
                //                        Text("By Name").tag(0)
                //                        Text("By Id").tag(2)
                //                    }
                //                }
                //                label: {
                //                    Label("Sort", systemImage: "arrow.up.arrow.down")
                //                }
            }
        }
        .onAppear {
            viewModel.load(modelContext: modelContext)
        }
    }
}

#Preview {
    MainMenuView()
}
