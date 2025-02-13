//
//  FeedView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct FeedView: View {
    @Environment(ContentView.ViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbYellow,
                    backgroundImage: .yellowBackground,
                    titleText: Text("Feed")
                )
            }
        }
    }
}

#Preview {
    FeedView()
        .environment(ContentView().viewModel)
}
