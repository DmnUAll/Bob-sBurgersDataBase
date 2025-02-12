//
//  FavoritesView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct FavoritesView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbGreen,
                    backgroundImage: .greenBackground,
                    titleText: Text("Favorites")
                )
            }
        }
    }
}

#Preview {
    FavoritesView()
}
