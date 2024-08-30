//
//  TvSeriesDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 21/8/24.
//

import Foundation

@MainActor
class TvSeriesDetailsVM : ObservableObject {
    
    let seriesApiService = TvSeriesApiService()
    
    @Published var casts : [Cast] = [Cast]()
    @Published var tvSeriesDetails: TvSeriesApiModel?
    @Published var similarSeries : [MovieApiModel]?
    @Published var backdropImage: String = ""
    @Published var goGenreSeriesListPage : Bool = false
    @Published var goCastDetailsPage : Bool = false
    
    @Published var selectedMovie : TvSeriesApiModel?
    
    
    init() {
//        movieDetails = DummyDataUtils.dummyMovieData01
//        casts = DummyCastData.castList
        
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
            
            let (similarSeries,_) = await seriesApiService.getSimilarTvSeries(id: seriesId)
            self.similarSeries = similarSeries?.results

            
        }
    }

   
}

    
