//
//  MovieListVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 13/7/24.
//

import Foundation

@MainActor
class MovieListVM: ObservableObject {
    
    let apiManager = ApiManager()

    @Published var goMovieDetailsPage: Bool = false
    @Published var selectedMovie: Int?

    @Published var isLoading = false
    @Published var movieDetails: MovieApiModel?

    @Published var nowPlayingMovies = [CommonItemData]()
    @Published var popularMovies = [CommonItemData]()
    @Published var topRatedMovies = [CommonItemData]()
    @Published var upComingMovies = [CommonItemData]()
   // @Published var similar = [CommonItemData]()

    let movieApiService = MovieApiService()

    init() {
        isLoading = false
//        nowPlayingMovies = DummyDataUtils.movieList
//        popularMovies = DummyDataUtils.movieList
//        topRatedMovies = DummyDataUtils.movieList
//        upComingMovies = DummyDataUtils.movieList

        getMovieList()
    }

    func getMovieList() {
        isLoading = true
        Task {
            async let nowPlaying = movieApiService.getMovieListByType(listType: .NowPlaying)
            async let popular = movieApiService.getMovieListByType(listType: .Popular)
            async let topRated = movieApiService.getMovieListByType(listType: .TopRated)
            async let upcoming = movieApiService.getMovieListByType(listType: .upcoming)
           // async let similar = movieApiService.getMovieListByType(listType: .similar)


            _ = await [nowPlaying, popular, topRated, upcoming]

            self.nowPlayingMovies = await nowPlaying.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.topRatedMovies = await topRated.0?.getCommonItemDataList()  ?? [CommonItemData]()
            self.upComingMovies = await upcoming.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.popularMovies = await popular.0?.getCommonItemDataList() ?? [CommonItemData]()
          //  self.similar = await similar.0?.getCommonItemDataList() ?? [CommonItemData]()
            isLoading = false

        }
    }
}
