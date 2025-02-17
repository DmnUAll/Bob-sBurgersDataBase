//
//  FeedViewViewModel.swift
//  BBDB
//
//  Created by Илья Валито on 14.02.2025.
//

import SwiftUI

extension FeedView {
    @Observable
    final class ViewModel {
        var charactersFeed: Characters = []
        
        func generateFeed(fromCharacters characters: Characters) {
            charactersFeed = Array(characters.shuffled()[0...4])
        }
        
    }
}

