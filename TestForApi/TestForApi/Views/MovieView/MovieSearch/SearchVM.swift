//
//  SearchVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation

class SearchVM : ObservableObject {
    
    // private let apiManager = ApiManager()
    @Published var movieList: [CommonItemData] = [CommonItemData]()
    @Published var searchText = ""
    @Published var selectedMovieId : Int = 0
    let movieApiService = MovieApiService()
    let tvSeriesApiService = TvSeriesApiService()
    

    @Published var selectedSearchType : ItemTypes = .Movie
    
    @MainActor func getSearchData() {
        Task {
            
            if selectedSearchType == .Movie {
                let (data, error) = await movieApiService.searchMovie(searchKeyword: searchText)
                movieList = data?.getCommonItemDataList() ?? [CommonItemData]()
            }else{
                // Tv Series
                let (data, error) = await tvSeriesApiService.searchTvSeries(searchKeyword: searchText)
                movieList = data?.getCommonItemDataList() ?? [CommonItemData]()
            }
            
        }
    }
    
}
