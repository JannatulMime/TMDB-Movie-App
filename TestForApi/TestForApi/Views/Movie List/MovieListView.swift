//
//  MovieListView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 8/7/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var vm = MovieListVM()

    var body: some View {
        ZStack {
            //  VStack{
            ScrollView {
                VStack(spacing: 5) {
                    SingleTopRatedMovieListItem(movies: vm.topRatedMovies, onMovieItemPressed: { movie in
                        vm.selectedMovie = movie
                        vm.goMovieDetailsPage = true
                    })
                        .frame(width:  UIScreen.main.bounds.size.width, height: 300)
                    

                    HorizontalMovieListWithTitle(movies: vm.nowPlayingMovies, title: "Now Playing", onMovieItemPressed: { movie in
                        vm.selectedMovie = movie
                        vm.goMovieDetailsPage = true
                    })

                    VerticalMovieListWithTitle(movies: vm.popularMovies, title: "Popular", onMovieItemPressed: { movie in
                        vm.selectedMovie = movie
                        vm.goMovieDetailsPage = true
                        
                    })

                    HorizontalMovieListWithTitle(movies: vm.upComingMovies, title: "UPcoming", onMovieItemPressed:  { movie in
                        vm.selectedMovie = movie
                        vm.goMovieDetailsPage = true})

                        .onAppear {
                            vm.getMovieList()
                        }
                }
                .navigationDestination(isPresented: $vm.goMovieDetailsPage) {
                    MovieDetailsView(movieId: vm.selectedMovie?.id ?? 0)
                }
                .navigationBarBackButtonHidden(true)
                
            }
            .padding(.bottom,100)
            //   }

            if vm.isLoading {
                LoadingView()
            }
            
               
        }.ignoresSafeArea()
           
    }
}

#Preview {
    MovieListView()
}
