//
//  BottomMovieDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 24/7/24.
//

import Foundation

class BottomMovieDetailsVM : ObservableObject {
    
    let movieApiService = MovieApiService()
  
    @Published var casts : [Cast] = [Cast]()
    @Published var movie: MovieApiModel?
    @Published var similar = [CommonItemData]()

   
    
//    init(movieData : MovieApiModel?, casts : [Cast]){
//        self.movie = movieData
//        self.casts = casts
//    }
    
    init(){
        
    }
    
    func setMovie(movieData : MovieApiModel?) {
        self.movie = movieData
    }
    
    func setCastData(casts : [Cast]){
        self.casts = casts
    }
    
    func setRecommendData(similarData : [CommonItemData]) {
        self.similar = similarData
    }
    
//    func similarMovieList() {
//        Task {
//            async let similar = movieApiService.getMovieListByType(listType: .similar)
//            
//            _ = await similar
//            self.similar = await similar.0?.getCommonItemDataList() ?? [CommonItemData]()
//        }
//    }
}
