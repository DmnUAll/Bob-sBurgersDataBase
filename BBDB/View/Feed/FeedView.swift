//
//  FeedView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct FeedView: View {
    
    var body: some View {
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
}
