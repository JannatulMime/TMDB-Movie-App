//
//  SearchVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation

class SearchVM : ObservableObject {
    
    private let apiManager = ApiManager()
    @Published var movieList: [MovieApiModel] = [MovieApiModel]()
    @Published var searchText = ""
    
//    init(){
//
//    }
    
    @MainActor func getSearchData() {
        Task {
            do {
                let movieSearchResponse: MovieSearchApiDataModel = try await apiManager.request(url: "https://api.themoviedb.org/3/search/movie", searchQuery: searchText)
                movieList = movieSearchResponse.results ?? [MovieApiModel]()
              //  print("U>> movie list count \(movieList.count)")

            } catch {
                print(error)
            }
        }
    }
    
}
