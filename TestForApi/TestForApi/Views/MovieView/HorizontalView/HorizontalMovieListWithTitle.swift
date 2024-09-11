//
//  HorizontalMovieListWithTitle.swift
//  TestForApi
//
//  Created by Habibur Rahman on 3/7/24.
//

import SwiftUI

struct HorizontalMovieListWithTitle: View {
   
    let movies: [CommonItemData]
    let title: String
    
    var onMovieItemPressed : (CommonItemData) -> Void
    

    var body: some View {
        VStack(alignment: .leading ,spacing: 10) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
               // .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(movies) { item in
                            HorizontalMovieListSingleItem(movie: item)
                            .onTapGesture {
                                onMovieItemPressed(item)
                            }
                        
                                        
                        
                        
                    }
               }//.padding(.horizontal, 5)
               
            }
        }
    }
}

#Preview {
    HorizontalMovieListWithTitle(movies: [DummyDataUtils.dummyMovieData01.commonItemData,DummyDataUtils.dummyMovieData02.commonItemData], title: "Now Playing", onMovieItemPressed: { _ in })
}
