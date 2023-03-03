//
//  ContentView.swift
//  Brainly
//
//  Created by Chetan Kachana on 3/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var test = false
    @State private var showingPanel = false
    var body: some View {
       NavigationSplitView(){
           List{
               Button("Open Floating Panel"){
                   showingPanel.toggle()
               }
               .floatingWindow(position:.zero, show: $showingPanel){
                   Image(systemName: "circle.fill")
                       .background(RoundedRectangle(cornerRadius: 25))
                       .frame(width:250, height:250)
                       .background(VisualEffectView().ignoresSafeArea())
               }
               NavigationLink("Home"){
                   HStack{
                       Text("Brainly")
                           .frame(minWidth:600)
                   }
                   
               }
              
              Divider()
               NavigationLink("Notifications"){
                   HStack{
                       Text("Notifications")
                           .frame(minWidth:600)
                   }
               }
               .badge(15)
              
           }
           .scrollDisabled(true)
           .listRowBackground(RoundedRectangle(cornerRadius:25)
               .background(Color.blue))
           .listStyle(.sidebar)
           .frame(minWidth:70, maxWidth:250)
       } detail:{
           Text("brainly")
               .frame(minWidth:600)
               .listStyle(.sidebar)
       }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
