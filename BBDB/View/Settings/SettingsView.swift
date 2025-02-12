//
//  SettingsView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbGray,
                    backgroundImage: .grayBackground,
                    titleText: Text("Settings")
                )
            }
        }
    }
}

#Preview {
    SettingsView()
}
