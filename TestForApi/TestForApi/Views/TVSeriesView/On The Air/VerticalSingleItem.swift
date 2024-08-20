//
//  VerticalSingleItem.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import SwiftUI

struct VerticalSingleItem: View {
    
    let tvSeries : TvSeriesApiModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            RemoteImage(imagePath: Utility.getWebImagePath(imageName: tvSeries.posterPath ?? ""))
               .frame(width: 130, height: 200)
                .cornerRadius(8)
                .shadow(color: .brown.opacity(0.4), radius: 10, x: 5, y: 5)
               
           
            Text(tvSeries.originalName ?? "")
           
                .font(.caption)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundStyle(.black)
                
            
            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.yellow)
                
                
                Text(tvSeries.name ?? "")
                    .font(.caption)
                    .foregroundStyle(.pink)
                
               // ImdbButton()
                
            }
        }
        .frame(width: 150)
        
    
    }
}

#Preview {
    VerticalSingleItem(tvSeries: DummyTvSeries.dummyTvSeries1)
}
