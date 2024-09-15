//
//  TvSeriesDetailsView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import SwiftUI

struct TvSeriesDetailsView: View {
    
    var seriesId = 223365
    @StateObject var vm = TvSeriesDetailsVM()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment : .topLeading) {
         
            RemoteImage(imagePath: vm.backdropImage)
                .clipShape(Rectangle())
                .frame(width: UIScreen.main.bounds.width, height: 320)
                .scaledToFill()
            
            
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.white)
                    .padding()
            }.padding(.top ,50)
            
       
            VStack {
                SeriesBottomDetails(tvSeries: $vm.tvSeriesDetails, 
                            casts: $vm.casts,
                            similarTvSeries: $vm.similarTvSeries, onSeriesItemPressed: { Details in
                    vm.goGenreSeriesListPage = true
                }, onPressed: { detailsCast in
                    vm.goCastDetailsPage = true
                  // vm.selectedMovie = Details
               })
                
                
                .padding(.top,300)
                .padding(.horizontal,0)
                   
                Spacer()
            }
            .navigationDestination(isPresented: $vm.goGenreSeriesListPage) {
                GenreMovieList()
            }
            
            .navigationDestination(isPresented: $vm.goCastDetailsPage) {
              // CastDetails()
            }
            
            
        }
        .background(Color.white)
        .onAppear{
            //vm.loadMovieData(movieId: movieId)
                vm.loadTvSeriesData(seriesId: seriesId)
        }
        //.frame(width: UIScreen.main.bounds.width)
          .ignoresSafeArea()
     
}



    }


#Preview {
    TvSeriesDetailsView()
}
