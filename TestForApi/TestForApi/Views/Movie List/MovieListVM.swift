//
//  MovieListVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 13/7/24.
//

import Foundation

@MainActor
class MovieListVM : ObservableObject {
    let apiManager = ApiManager()
    
    @Published var goMovieDetailsPage : Bool = false
    @Published var selectedMovie : MovieApiModel?
    
    @Published var isLoading = false
    @Published var movieDetails: MovieApiModel?
    
    @Published var nowPlayingMovies = [MovieApiModel]()
    @Published var popularMovies = [MovieApiModel]()
    @Published var topRatedMovies = [MovieApiModel]()
    @Published var upComingMovies = [MovieApiModel]()
    
    
    init(){
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
                do {
                    let nowPlayingResponse: MovieListApiResponse = try await apiManager.request(url: "https://api.themoviedb.org/3/movie/now_playing")
                    self.nowPlayingMovies = nowPlayingResponse.results ?? [MovieApiModel]()
                    
                    let popularMovieResponse: MovieListApiResponse = try await apiManager.request(url: "https://api.themoviedb.org/3/movie/popular")
                    self.popularMovies = popularMovieResponse.results ?? [MovieApiModel]()
                    
                    let topRatedMovieResponse: MovieListApiResponse = try await apiManager.request(url:
                                                                                                    "https://api.themoviedb.org/3/movie/top_rated")
                    self.topRatedMovies = topRatedMovieResponse.results ?? [MovieApiModel]()
                    
                    let upComingMovieResponse: MovieListApiResponse = try await apiManager.request(url:
                                                                                                    "https://api.themoviedb.org/3/movie/upcoming")
                    self.upComingMovies = upComingMovieResponse.results ?? [MovieApiModel]()
                    
                    isLoading = false
                    
                } catch {
                    print(error)
                    isLoading = false
                }
            
        }
        
    }
}



