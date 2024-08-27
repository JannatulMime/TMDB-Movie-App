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
            ScrollView {
                VStack(spacing: 5) {
                    SingleTopRatedMovieListItem(movies: vm.topRatedSeries, onMovieItemPressed: { _ in
                        vm.goTvSeriesDetailsPage = true
                    })
                    .frame(width: UIScreen.main.bounds.size.width, height: 300)

                    HorizontalMovieListWithTitle(movies: vm.airingTodaySeries, title: "Airing Today", onMovieItemPressed: { data in
                        vm.selectedId = data.id
                        vm.goTvSeriesDetailsPage = true
                    })

                    VerticalMovieListWithTitle(movies: vm.onTheAirSeries, title: "On The Air", onMovieItemPressed: { _ in
                        // vm.selectedMovie = movie
                        vm.goTvSeriesDetailsPage = true
                    })

//                   HorizontalMovieListWithTitle(movies: vm.airingTodaySeries, title: "Popular", onMovieItemPressed: { movie in
//                        vm.selectedMovie = movie
//                        vm.goTvSeriesDetailsPage = true
//                    })

                    .onAppear {
                        vm.getTvSeriesList()
                    }
                }
                .navigationDestination(isPresented: $vm.goTvSeriesDetailsPage) {
                    // MovieDetailsView(seriesId: vm.selectedMovie?.id ?? 0)
                    TvSeriesDetailsView(seriesId: vm.selectedId ?? 0)
                }
                .navigationBarBackButtonHidden(true)
            }
            .padding(.bottom, 100)
            //   }

            if vm.isLoading {
                LoadingView()
            }

        }.ignoresSafeArea()
    }
}

#Preview {
    TvSeriesListView()
}
