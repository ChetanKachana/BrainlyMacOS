//
//  BrainlyApp.swift
//  Brainly
//
//  Created by Chetan Kachana on 3/1/23.
//

import SwiftUI

@main
struct BrainlyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth:850, minHeight:600)
                
                
        }
        
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact(showsTitle: false))
    }
}
