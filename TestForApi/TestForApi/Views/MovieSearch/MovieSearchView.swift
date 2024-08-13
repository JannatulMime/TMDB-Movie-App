//
//  MovieSearchView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 8/7/24.
//

import SwiftUI

struct MovieSearchView: View {
    
    @StateObject var vm = SearchVM()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(vm.movieList) { item in

                        let imagePath = Utility.getWebImagePath(imageName: item.posterPath ?? "")

                        NavigationLink(destination: MovieDetailsView(movieId: item.id ?? 0)) {
                            SearchListView(name: item.title ?? "noData", posterPath: imagePath)
                               
                        }
                    }
                }
            }.searchable(text: $vm.searchText)
                .navigationTitle("Search")

        }.onChange(of: vm.searchText) { _, _ in
            vm.getSearchData()
        }
    }
}

#Preview {
    NavigationStack {
        MovieSearchView()
    }
}
