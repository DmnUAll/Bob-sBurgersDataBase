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
    @Query var characters: Characters
    
    @State private var viewModel = ViewModel()
    
    init() {
        viewModel.load(modelContext)
    }
        
    var body: some View {
        if viewModel.isLoading {
            LoadingView()
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
//            .environment(viewModel)
            .tint(.bbdbBlack)
        }
        
    }
}

#Preview {
    ContentView()
}
