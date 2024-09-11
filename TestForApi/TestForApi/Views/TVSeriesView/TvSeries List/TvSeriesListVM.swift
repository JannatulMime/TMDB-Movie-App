//
//  TvSeriesListVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import Foundation

@MainActor
class TvSeriesListVM: ObservableObject {
    
    let tvSeriesApiService = TvSeriesApiService()
    
    @Published var goTvSeriesDetailsPage: Bool = false
    @Published var selectedId : Int?
    
    @Published var isLoading = false
    @Published var tvSeriesDetails: TvSeriesApiModel?
    
    @Published var airingTodaySeries = [CommonItemData]()
    @Published var onTheAirSeries = [CommonItemData]()
    @Published var popularSeries = [CommonItemData]()
    @Published var topRatedSeries = [CommonItemData]()
    
    
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
            
            self.airingTodaySeries = await airingToday.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.onTheAirSeries = await onTheAir.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.popularSeries = await popular.0?.getCommonItemDataList() ?? [CommonItemData]()
            self.topRatedSeries = await topRated.0?.getCommonItemDataList() ?? [CommonItemData]()
            isLoading = false
            
        }
    }
}
