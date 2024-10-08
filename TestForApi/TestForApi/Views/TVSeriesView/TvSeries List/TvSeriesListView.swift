//
//  TvSeriesListView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import SwiftUI

struct TvSeriesListView: View {
    @StateObject var vm = TvSeriesListVM()

    var body: some View {
        ZStack {
            //  VStack{
            ScrollView(showsIndicators: false) {
                VStack(spacing: 5) {
                    SingleTopRatedMovieListItem(movies: vm.topRatedSeries, onMovieItemPressed: { data in
                        vm.selectedId = data.id
                        vm.goTvSeriesDetailsPage = true
                    })
                    .frame(width: UIScreen.main.bounds.size.width, height: 300)
                    
                    VStack {
                        
                        HorizontalMovieListWithTitle(movies: vm.airingTodaySeries, title: "Airing Today", onMovieItemPressed: { data in
                            vm.selectedId = data.id
                            vm.goTvSeriesDetailsPage = true
                        })
                        
                        VerticalMovieListWithTitle(movies: vm.onTheAirSeries, title: "On The Air", onMovieItemPressed: { data in
                            vm.selectedId = data.id
                            vm.goTvSeriesDetailsPage = true
                        })
                        
                        HorizontalMovieListWithTitle(movies: vm.airingTodaySeries, title: "Popular", onMovieItemPressed: { data in
                            vm.selectedId = data.id
                            vm.goTvSeriesDetailsPage = true
                        })
                    }.padding()

                    
                }
                
                .onAppear {
                    vm.getTvSeriesList()
                }
                
                .navigationDestination(isPresented: $vm.goTvSeriesDetailsPage) {
                    MovieDetailsView(movieId: vm.selectedId ?? 0, itemType : ItemType.series)
                }
                .navigationBarBackButtonHidden(true)
            }
            .padding(.bottom, 100)
            //   }

            if vm.isLoading {
                LoadingView()
            }

        }.ignoresSafeArea()
            .background(.black)
    }
}

#Preview {
    TvSeriesListView()
}
