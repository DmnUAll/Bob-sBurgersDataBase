//
//  ContentView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                Group {
                    FeedView()
                        .tabItem {
                            Image.convertToIcon(named: "feedIcon", withSize: 48)
                        }
                        .environment(viewModel)
                    
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
        }
        .tint(.bbdbBlack)
    }
}

#Preview {
    ContentView()
}
