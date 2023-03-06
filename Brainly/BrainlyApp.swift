//
//  BrainlyApp.swift
//  Brainly
//
//  Created by Chetan Kachana on 3/1/23.
//

import SwiftUI

@main
struct BrainlyApp: App {
    @State private var showingPanel = false
    @State private var position: CGPoint = .zero
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .topTrailing){
                ContentView()
                    .frame(minWidth:850, minHeight:600)
                Button{
                    showingPanel.toggle()
                } label: {
                    Image(systemName:"rectangle.stack.fill")
                    
                }
                .padding()
                .offset(x: 7, y:-43)
                .floatingWindow(position:position, show: $showingPanel){
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(VisualEffectView().ignoresSafeArea())
                        .ignoresSafeArea()
                        .frame(width:200, height:60 )
                        
                    
                }
                
                .buttonStyle(.plain)
                
            }
         
        }
        .commands{
            SidebarCommands()
            ToolbarCommands()
        }
        .windowStyle(.hiddenTitleBar)
        .windowToolbarStyle(.unifiedCompact(showsTitle: false))
    }
}
