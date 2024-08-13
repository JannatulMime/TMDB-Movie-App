//
//  PopularView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 18/7/24.
//

import SwiftUI

struct VerticalMovieListWithTitle: View {
    let movies: [MovieApiModel]
    let title: String
   
    var onMovieItemPressed : (MovieApiModel) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
               
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(movies) { item in
                        VerticalMovieListSingleItem(movie: item)
                            .onTapGesture {
                                onMovieItemPressed(item)
                            }
                        
                        
//                        NavigationLink(destination: MovieDetailsView(movieId: item.id ?? 0)) {
//                            VerticalMovieListSingleItem(title: item.title ?? "", imagePath: imagePath)
//                            
//                        }
                    }
                    
                }
                
                
            }
        }.padding(.horizontal)
        
    }
}

#Preview {
    VerticalMovieListWithTitle(movies: [DummyDataUtils.dummyMovieData01,DummyDataUtils.dummyMovieData02], title: "Popular", onMovieItemPressed: { _ in })
}
