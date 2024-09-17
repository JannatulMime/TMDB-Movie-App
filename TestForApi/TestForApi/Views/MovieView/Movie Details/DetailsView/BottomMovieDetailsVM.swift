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

    init(){
        
    }
    
}
