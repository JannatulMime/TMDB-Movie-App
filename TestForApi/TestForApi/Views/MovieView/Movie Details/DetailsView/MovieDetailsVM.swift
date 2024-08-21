//
//  MovieDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 7/7/24.
//

import Foundation

@MainActor
class MovieDetailsVM : ObservableObject {
    
    let apiManager = ApiManager()
    
    @Published var casts : [Cast] = [Cast]()
    @Published var movieDetails: MovieApiModel?
    @Published var backdropImage: String = ""
    @Published var goGenreMovieListPage : Bool = false
    @Published var goCastDetailsPage : Bool = false
    
   // @Published var selectedMovie : MovieApiModel?
    
    
    init() {
//        movieDetails = DummyDataUtils.dummyMovieData01
//        casts = DummyCastData.castList
        
    }
    
    func loadMovieData(movieId : Int) {
        Task {
            do {
                let movieDetailsResponse: MovieApiModel = try await apiManager.request(url: "https://api.themoviedb.org/3/movie/\(movieId)")
                self.movieDetails = movieDetailsResponse
                if let poster = self.movieDetails?.backdropPath {
                    backdropImage = "https://image.tmdb.org/t/p/original\(poster)"
                }
                
                let creditUrl = "https://api.themoviedb.org/3/movie/\(movieId)/credits"
                let creditResponseModel: MovieCreditApiResponseModel = try await apiManager.request(url: creditUrl)
                
                DispatchQueue.main.async {
                    if let movieCasts = creditResponseModel.cast {
                        self.casts = movieCasts
                    }
                }
               

            } catch {
                print(error)
            }
        }
    }
    

    func loadTvSeriesData(seriesId : Int) {
        Task {
            do {
                let movieDetailsResponse: MovieApiModel = try await apiManager.request(url: "https://api.themoviedb.org/3/tv/\(seriesId)")
                self.movieDetails = movieDetailsResponse
                if let poster = self.movieDetails?.backdropPath {
                    backdropImage = "https://image.tmdb.org/t/p/original\(poster)"
                }
                
                let creditUrl = "https://api.themoviedb.org/3/tv/\(seriesId)/credits"
                let creditResponseModel: MovieCreditApiResponseModel = try await apiManager.request(url: creditUrl)
                
                DispatchQueue.main.async {
                    if let movieCasts = creditResponseModel.cast {
                        self.casts = movieCasts
                    }
                }
               

            } catch {
                print(error)
            }
        }
    }
    
   
}
