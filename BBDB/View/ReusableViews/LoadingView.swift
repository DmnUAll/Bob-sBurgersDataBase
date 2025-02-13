//
//  LoadingView.swift
//  BBDB
//
//  Created by Илья Валито on 13.02.2025.
//

import SwiftUI

struct LoadingView: View {
    @State private var rotationDegrees = 0.0
    
    var body: some View {
        ZStack {
            Color.bbdbYellow
                .ignoresSafeArea()
            
            Image(.burger)
                .resizable()
                .scaledToFit()
                .frame(width: 256, height: 256, alignment: .center)
                .rotationEffect(.degrees(rotationDegrees))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(0.1).repeatForever(autoreverses: false)) {
                            rotationDegrees = 360.0
                        }
                }
        }
    }
    
}

#Preview {
    LoadingView()
}
