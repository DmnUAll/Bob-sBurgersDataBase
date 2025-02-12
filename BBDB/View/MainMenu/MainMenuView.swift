//
//  MainMenuView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct MainMenuView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbBlue,
                    backgroundImage: .blueBackground,
                    titleText: Text("Main Menu")
                )
            }
        }
    }
}

#Preview {
    MainMenuView()
}
