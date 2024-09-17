//
//  MovieDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 7/7/24.
//

import Foundation

@MainActor
class MovieDetailsVM: ObservableObject {
    
    @Published var tvSeriesDetails: TvSeriesApiModel?
    @Published var goGenreSeriesListPage : Bool = false
   // @Published var goCastDetailsPage : Bool = false
  //  @Published var similarTvSeries : [CommonItemData] = []
    
    
    let apiManager = ApiManager()
    
    let seriesApiService = TvSeriesApiService()
    let movieApiService = MovieApiService()

    @Published var casts: [Cast] = [Cast]()
    @Published var movieDetails: MovieApiModel?
    @Published var backdropImage: String = ""
    @Published var goGenreMovieListPage: Bool = false
    @Published var goCastDetailsPage: Bool = false
    @Published var similarMovie: [CommonItemData] = []

    init() {
//        movieDetails = DummyDataUtils.dummyMovieData01
//        casts = DummyCastData.castList
    }

    func loadMovieData(movieId: Int) {
        Task {
            let movieDetailsResponse: MovieApiModel = try await apiManager.request(url: "https://api.themoviedb.org/3/movie/\(movieId)")
            self.movieDetails = movieDetailsResponse
            self.backdropImage = Utility.getWebImagePath(imageName: self.movieDetails?.backdropPath ?? "")


            let creditUrl = "https://api.themoviedb.org/3/movie/\(movieId)/credits"
            let creditResponseModel: MovieCreditApiResponseModel = try await apiManager.request(url: creditUrl)

            DispatchQueue.main.async {
                if let movieCasts = creditResponseModel.cast {
                    self.casts = movieCasts
                }
            }

            let (similarMovie, _) = await movieApiService.getSimilarMovie(id: movieId)
            self.similarMovie = similarMovie?.getCommonItemDataList() ?? []
        }
    }
    
    
    func loadTvSeriesData(seriesId : Int) {
        Task {
           
            let (seriesDetails,_) = await seriesApiService.getSeriesDetailsBy(id: seriesId)
            self.tvSeriesDetails = seriesDetails

            backdropImage = Utility.getWebImagePath(imageName: self.tvSeriesDetails?.backdropPath ?? "" )
            
            let (creditdata,_) = await seriesApiService.getSeriesCreditsBy(id: seriesId)
            self.tvSeriesDetails = seriesDetails

            DispatchQueue.main.async {
                if let casts = creditdata?.cast {
                    self.casts = casts
                }
            }
            
            let (similarTvSeries,_) = await seriesApiService.getSimilarTvSeries(id: seriesId)
            self.similarMovie = similarTvSeries?.getCommonItemDataList() ?? []

            
        }
    }
}
