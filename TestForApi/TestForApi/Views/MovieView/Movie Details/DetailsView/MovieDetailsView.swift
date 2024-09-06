//
//  MovieDetailsView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 4/7/24.
//
import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var vm = MovieDetailsVM()
    var movieId = 1022789
   

    var body: some View {
       
            ZStack (alignment : .top) {
             
                RemoteImage(imagePath: vm.backdropImage)
                    .clipShape(Rectangle())
                    .frame(width: UIScreen.main.bounds.width, height: 320)
                    .scaledToFill()
           
                VStack {
                    BottomDetails(movie: $vm.movieDetails , 
                                  casts: $vm.casts, 
                                  similarMovie : $vm.similarMovie,
                                  onMovieItemPressed: { Details in
                        vm.goGenreMovieListPage = true
                        //vm.selectedMovie = Details
                    }, onPressed: { detailsCast in
                        vm.goCastDetailsPage = true
                    })
                    
                    .padding(.top,300)
                    .padding(.horizontal,0)
                       
                    Spacer()
                }
                .navigationDestination(isPresented: $vm.goGenreMovieListPage) {
                    GenreMovieList()
                }
                
                .navigationDestination(isPresented: $vm.goCastDetailsPage) {
                   //CastDetails()
                }
                
                
            }
            .background(Color.white)
            .onAppear{
                vm.loadMovieData(movieId: movieId)
//                vm.loadTvSeriesData(seriesId: seriesId)
            }
            //.frame(width: UIScreen.main.bounds.width)
        .ignoresSafeArea()
         
    }
    

}

#Preview {
    MovieDetailsView()
//        MovieDetailsView(imagePath: "https://image.tmdb.org/t/p/original//gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
}

