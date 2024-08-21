//
//  TvSeriesListVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import Foundation

@MainActor
class TvSeriesListVM: ObservableObject {
    let apiManager = ApiManager()
    
    @Published var goTvSeriesDetailsPage: Bool = false
    @Published var selectedMovie: MovieApiModel?
    
    @Published var isLoading = false
    @Published var tvSeriesDetails: MovieApiModel?
    
    @Published var airingTodaySeries = [MovieApiModel]()
    @Published var onTheAirSeries = [MovieApiModel]()
    @Published var popularSeries = [MovieApiModel]()
    @Published var topRatedSeries = [MovieApiModel]()
    
    let tvSeriesApiService = TvSeriesApiService()
    
    init() {
        isLoading = false
        getTvSeriesList()
    }
    func getTvSeriesList() {
        isLoading = true
        Task {
            async let airingToday = tvSeriesApiService.getTvSeriesListByType(listType: .AiringToday)
            async let onTheAir = tvSeriesApiService.getTvSeriesListByType(listType: .OnTheAir)
            async let popular = tvSeriesApiService.getTvSeriesListByType(listType: .Popular)
            async let topRated = tvSeriesApiService.getTvSeriesListByType(listType: .TopRated)
            
            _ = await [airingToday, onTheAir, popular, topRated]
            
            self.airingTodaySeries = await airingToday.0?.results ?? [MovieApiModel]()
            self.onTheAirSeries = await onTheAir.0?.results ?? [MovieApiModel]()
            self.popularSeries = await popular.0?.results ?? [MovieApiModel]()
            self.topRatedSeries = await topRated.0?.results ?? [MovieApiModel]()
            isLoading = false
            
        }
    }
}
