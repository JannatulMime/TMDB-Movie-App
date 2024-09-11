//
//  SeriesBottomDetailsVM.swift
//  TestForApi
//
//  Created by Habibur Rahman on 26/8/24.
//

import Foundation

class SeriesBottomDetailsVM : ObservableObject {
    
    let tvSeriesApiService = TvSeriesApiService()
  
    @Published var casts : [Cast] = [Cast]()
    @Published var tvSeries : TvSeriesApiModel?
    @Published var selectedSeries: Int?
    @Published var goTvSeriesDetailsPage: Bool = false


    init(){
        
    }
    
}
