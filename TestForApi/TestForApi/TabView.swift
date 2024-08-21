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
                
                TvSeriesListView()
                     .tabItem {
                         VStack {
                             Image(systemName: "tv")
                             Text("Movies")
                         }
                     }.tag(0)
                
               MovieListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "movieclapper")
                            Text("Tv Series")
                        }
                    }.tag(1)
                
                 MovieSearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }.tag(2)
              
            }//.background(Color.white)
        }
        
        
    }
}

#Preview {
    ContentView()
}
