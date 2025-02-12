//
//  WhoAmIView.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftUI

struct WhoAmIView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(
                    backGroundColor: .bbdbRed,
                    backgroundImage: .redBackground,
                    titleText: Text("Who Am I?")
                )
            }
        }
    }
}

#Preview {
    WhoAmIView()
}
