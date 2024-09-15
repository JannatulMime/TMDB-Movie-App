//
//  ContentView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 30/6/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        NavigationStack {
            TabView {
                MovieListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "movieclapper")
                            Text("Movie")
                        }
                    }.tag(0)

                TvSeriesListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "tv")
                            Text("TV")
                                .foregroundStyle(.red)
                        }
                    }.tag(1)

                MovieSearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }.tag(2)
            }
            .tint(.white)
        }
    }
}

#Preview {
    ContentView()
}
