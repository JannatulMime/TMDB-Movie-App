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
        
        VStack{
            ZStack {
                CustomSearchView(searchText: $vm.searchText)
                    .padding(.horizontal)

                HStack {
                    Spacer()
                    dropDownView(selection: $vm.selectedSearchType)
                }.padding()
            }
            
            ScrollView {
                VStack {
                    ForEach(vm.movieList) { item in

                        let imagePath = Utility.getWebImagePath(imageName: item.posterPath ?? "")

                        NavigationLink(destination: MovieDetailsView(movieId: item.id ?? 0)) {
                            SearchListView(name: item.name ?? "noData", posterPath: imagePath)
                        }
                    }
                }
            }
        }.background(Color.white)
        .padding(.bottom,50)
        
    
        .onChange(of: vm.searchText) { _, _ in
            vm.getSearchData()
        }
        .onChange(of: vm.selectedSearchType) { prevTypes, newTypes in
            if prevTypes != newTypes {
                vm.getSearchData()
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieSearchView()
    }
}
