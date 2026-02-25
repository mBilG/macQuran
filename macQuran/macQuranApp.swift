//
//  macQuranApp.swift
//  macQuran
//
//  Created by mBilG on 02/07/2021.
//

import SwiftUI

@main
struct macQuranApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hiding title bar
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle(showsTitle: false))
    }
}
