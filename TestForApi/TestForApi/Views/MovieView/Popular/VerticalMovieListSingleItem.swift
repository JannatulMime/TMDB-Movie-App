//
//  PopularSingleView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 18/7/24.
//

import SwiftUI

struct VerticalMovieListSingleItem: View {
    
    let movie : MovieApiModel
    
    var body: some View {
        HStack(spacing: 10) {
            
            RemoteImage(imagePath: Utility.getWebImagePath(imageName: movie.posterPath ?? ""))
                .frame(width: 130, height: 200)
                .cornerRadius(8)
                .clipped()
                .shadow(color: .brown.opacity(0.4), radius: 10, x: 5, y: 5)
            
           
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.originalTitle ?? "")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .lineSpacing(0.0)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.leading)
            
                HStack(spacing: 3) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.yellow)
                    
                    
                    Text(movie.scoreText)
                        .font(.caption)
                        .foregroundStyle(.pink)
                    
                  //  ImdbButton()
                }
            }
            Spacer()
            
        }
       
    }
    
}

#Preview {
    VerticalMovieListSingleItem(movie: DummyDataUtils.dummyMovieData01)
}
