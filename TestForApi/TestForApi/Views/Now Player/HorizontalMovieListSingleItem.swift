//
//  SingleNowPlayingView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 30/6/24.
//

import SwiftUI

struct HorizontalMovieListSingleItem: View {
 
    let movie : MovieApiModel

    var body: some View {
       
        VStack(alignment: .leading, spacing: 5) {
            RemoteImage(imagePath: Utility.getWebImagePath(imageName: movie.posterPath ?? ""))
               .frame(width: 130, height: 200)
                .cornerRadius(8)
                .shadow(color: .brown.opacity(0.4), radius: 10, x: 5, y: 5)
               
           
            Text(movie.originalTitle ?? "")
                .font(.caption)
                .fontWeight(.bold)
                .lineLimit(1)
                .foregroundStyle(.black)
                
            
            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.yellow)
                
                
                Text(movie.scoreText)
                    .font(.caption)
                    .foregroundStyle(.pink)
                
               // ImdbButton()
                
            }
        }
        .frame(width: 150)
        
    }
}

#Preview {
    HorizontalMovieListSingleItem(movie: DummyDataUtils.dummyMovieData01)
}
