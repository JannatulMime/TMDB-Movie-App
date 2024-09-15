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
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
       
            ZStack (alignment : .topLeading) {
             
                
                RemoteImage(imagePath: vm.backdropImage)
                    .clipShape(Rectangle())
                    .frame(width: UIScreen.main.bounds.width , height: 320)
                    .scaledToFill()
                
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                        .padding()
                }.padding(.top ,50)
                
           
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
//
                    .padding(.top,300)
                   .padding(.horizontal,0)
//                       
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width)
                .navigationDestination(isPresented: $vm.goGenreMovieListPage) {
                    GenreMovieList()
                }
                
                .navigationDestination(isPresented: $vm.goCastDetailsPage) {
                   //CastDetails()
                }
                
                
            }
            //.ignoresSafeArea()
            .background(Color.black)
            .onAppear{
                vm.loadMovieData(movieId: movieId)
            }
        //.frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea()
       
      //  .navigationTitle("")
      
         
    }
    

}

#Preview {
    MovieDetailsView()
//        MovieDetailsView(imagePath: "https://image.tmdb.org/t/p/original//gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
}

