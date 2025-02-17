//
//  ContentView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \CartoonCharacter.id) private var characters: Characters
    
    @State private var viewModel = ViewModel()
   
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
                .onAppear {
                    viewModel.load(modelContext: modelContext)
                }
        } else {
            TabView {
                Group {
                    FeedView()
                        .tabItem {
                            Image.convertToIcon(named: "feedIcon", withSize: 48)
                        }
                    
                    MainMenuView()
                        .tabItem {
                            Image.convertToIcon(named: "menuIcon", withSize: 48)
                        }
                    
                    FavoritesView()
                        .tabItem {
                            Image.convertToIcon(named: "favoritesIcon", withSize: 48)
                        }
                    
                    WhoAmIView()
                        .tabItem {
                            Image.convertToIcon(named: "whoAmIIcon", withSize: 48)
                        }
                    
                    SettingsView()
                        .tabItem {
                            Image.convertToIcon(named: "settingsIcon", withSize: 48)
                        }
                }
            }
            .accentColor(.bbdbBrown)
        }
    }
}

#Preview {
    ContentView()
}
