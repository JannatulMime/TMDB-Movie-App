//
//  MovieSearchView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 8/7/24.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var vm = SearchVM()
    @State var isMoviePressed : Bool = false
    @State var isSeriesPressed : Bool = false

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

                        SingleSearchListItemView(name: item.name ?? "noData", posterPath: imagePath)
                                .onTapGesture {
                                    vm.selectedMovieId = item.id ?? 0
                                    if vm.selectedSearchType == .Movie {
                                        isMoviePressed = true
                                    }else{
                                        isSeriesPressed = true
                                    }
                                }
                    }
                }
            }
        }
        .padding(.bottom, 20)
      
        .background(.black)
    
        .onChange(of: vm.searchText) { _, _ in
            vm.getSearchData()
        }
        .onChange(of: vm.selectedSearchType) { prevTypes, newTypes in
            if prevTypes != newTypes {
                vm.getSearchData()
            }
        }
        
        .navigationDestination(isPresented: $isMoviePressed) {
            MovieDetailsView(movieId: vm.selectedMovieId, itemType : ItemType.movie)
        }
        .navigationDestination(isPresented: $isSeriesPressed) {
            MovieDetailsView(movieId: vm.selectedMovieId, itemType : ItemType.series)
        }
    }
}

#Preview {
    NavigationStack {
        MovieSearchView()
    }
}
