//
//  HorizontalAiringListItem.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import SwiftUI

struct HorizontalAiringListItem: View {
    let tvSeries : [TvSeriesApiModel]
    let title: String
    
    var onMovieItemPressed : (TvSeriesApiModel) -> Void
    
    var body: some View {
       
        VStack(alignment: .leading ,spacing: 10) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 2) {
                    ForEach(tvSeries) { series in
                            HorizontalSingleItem(tvSeries: series)
                            .onTapGesture {
                                onMovieItemPressed(series)
                            }
                        
                                        
                        
                        
                    }
               }.padding(.horizontal, 5)
               
            }
        }

    }
}

#Preview {
    HorizontalAiringListItem(tvSeries: [DummyTvSeries.dummyTvSeries1, DummyTvSeries.dummyTvSeries2], title: "Airing Today", onMovieItemPressed: { _ in })
}
