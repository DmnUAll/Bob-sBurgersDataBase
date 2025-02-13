//
//  BackgroundView.swift
//  BBDB
//
//  Created by Илья Валито on 12.02.2025.
//

import SwiftUI

struct BackgroundView: View {
    
    let backGroundColor: Color
    let backgroundImage: ImageResource
    let titleText: Text
    
    var body: some View {
        ZStack {
            backGroundColor
                .ignoresSafeArea()
            
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .opacity(0.4)
                .ignoresSafeArea()
        
            .toolbar {
                ToolbarItem(placement: .principal) {
                    titleText
                        .font(.localizedFont(style: .filled, size: 36))
                }
            }
        }
    }
}
