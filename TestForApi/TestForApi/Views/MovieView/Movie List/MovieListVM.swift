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
    @Published var selectedMovie: MovieApiModel?

    @Published var isLoading = false
    @Published var movieDetails: MovieApiModel?

    @Published var nowPlayingMovies = [CommonItemData]()
    @Published var popularMovies = [CommonItemData]()
    @Published var topRatedMovies = [CommonItemData]()
    @Published var upComingMovies = [CommonItemData]()

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

            _ = await [nowPlaying, popular, topRated, upcoming]

            self.nowPlayingMovies = await nowPlaying.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.topRatedMovies = await topRated.0?.getCommonItemDataList()  ?? [CommonItemData]()
            self.upComingMovies = await upcoming.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.popularMovies = await popular.0?.getCommonItemDataList() ?? [CommonItemData]()
            isLoading = false

            //              do {

//                    let popularMovieResponse: MovieListApiResponse = try await apiManager.request(url: "https://api.themoviedb.org/3/movie/popular")
//                    self.popularMovies = popularMovieResponse.results ?? [MovieApiModel]()
//
//                    let topRatedMovieResponse: MovieListApiResponse = try await apiManager.request(url:
//                                                                                                    "https://api.themoviedb.org/3/movie/top_rated")
//                    self.topRatedMovies = topRatedMovieResponse.results ?? [MovieApiModel]()
//
//                    let upComingMovieResponse: MovieListApiResponse = try await apiManager.request(url:
//                                                                                                    "https://api.themoviedb.org/3/movie/upcoming")
//                    self.upComingMovies = upComingMovieResponse.results ?? [MovieApiModel]()

//                    isLoading = false

//                } catch {
//                    print(error)
//                    isLoading = false
//                }
        }
    }
}
