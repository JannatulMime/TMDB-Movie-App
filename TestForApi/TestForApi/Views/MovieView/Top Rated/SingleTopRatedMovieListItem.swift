//
//  SingleTopRatedMovieListItem.swift
//  TestForApi
//
//  Created by Habibur Rahman on 24/7/24.
//

import SwiftUI

struct SingleTopRatedMovieListItem: View {
    @State private var currentPage = 0

    let movies: [CommonItemData]
    var onMovieItemPressed: (CommonItemData) -> Void

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0 ..< movies.count, id: \.self) { index in
                    let movie = movies[index]

                    ZStack(alignment: .bottomLeading) {
                        let imagePath = Utility.getWebImagePath(imageName: movie.backdropPath ?? "")
                        RemoteImage(imagePath: imagePath)
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.size.width)

                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(1.0), Color.clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )

                        Text(movie.name ?? "")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.vertical, 60)
                            .padding(.leading, 20)
                    }
                    .tag(index)
                    .onTapGesture {
                        onMovieItemPressed(movie)
                    }
                }
            }

            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

            // .cornerRadius(10)
            //  .padding([.leading, .trailing], 10)
            Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        if movies.count > 0 {
                            currentPage = (currentPage + 1) % movies.count
                        }
                    }
                }
        }
    }

    let timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
}

#Preview {
    SingleTopRatedMovieListItem(movies: [DummyDataUtils.dummyMovieData01.commonItemData, DummyDataUtils.dummyMovieData02.commonItemData], onMovieItemPressed: { _ in })
}
