//
//  ContentView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 30/6/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack{
            TabView {
                
                MovieListView()
                     .tabItem {
                         VStack {
                             Image(systemName: "movieclapper")
                             Text("Movie")
                         }
                     }.tag(0)
                   // .background(.green)
                
                TvSeriesListView()
                     .tabItem {
                         VStack {
                             Image(systemName: "tv")
                             Text("TV")
                         }
                     }.tag(1)
                
                 MovieSearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }.tag(2)
              
            }.onAppear() {
                UITabBar.appearance().backgroundColor = .clear
             
            }.tint(.purple)
           

        }
        
        
    }
}

#Preview {
    ContentView()
}
