//
//  BBDBApp.swift
//  BBDB
//
//  Created by Илья Валито on 11.02.2025.
//

import SwiftData
import SwiftUI

@main
struct BBDBApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CartoonCharacter.self)
    }
}
