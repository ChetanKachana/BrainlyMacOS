//
//  ContentView.swift
//  Brainly
//
//  Created by Chetan Kachana on 3/1/23.
//

import SwiftUI

struct ContentView: View {
   
   
    var body: some View {
       
       NavigationSplitView(){
           List{
            
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
           .navigationSplitViewColumnWidth(min: 70, ideal: 100, max: 250)
           .scrollDisabled(true)
           .listRowBackground(RoundedRectangle(cornerRadius:25)
               .background(Color.blue))
           .listStyle(.sidebar)
           //.frame(minWidth:70)
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
