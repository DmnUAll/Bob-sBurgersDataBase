//
//  FeedView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftData
import SwiftUI

struct FeedView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var characters: Characters
    
    @State private var viewModel = ViewModel()
    
    private let rows = [
        GridItem(.adaptive(minimum: 400))
    ]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .bbdbBrown
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.bbdbBrown.withAlphaComponent(0.2)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbYellow,
                    backgroundImage: .yellowBackground,
                    titleText: Text("Feed")
                )
                
                TabView {
                    ForEach(viewModel.charactersFeed) { character in
                        CharacterView(character: character)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: UIScreen.main.bounds.width)
                .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.generateFeed(fromCharacters: characters)
        }
    }
}

#Preview {
    FeedView()
}
