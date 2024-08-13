//
//  BottomMovieDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 24/7/24.
//

import Foundation

class BottomMovieDetailsVM : ObservableObject {
  
    @Published var casts : [Cast] = [Cast]()
    @Published var movie: MovieApiModel?
   
    
//    init(movieData : MovieApiModel?, casts : [Cast]){
//        self.movie = movieData
//        self.casts = casts
//    }
    
    init(){
        
    }
    
    func setMovie(movieData : MovieApiModel?){
        self.movie = movieData
    }
    
    func setCastData(casts : [Cast]){
        self.casts = casts
    }
}
