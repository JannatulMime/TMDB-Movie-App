//
//  BottomDetails.swift
//  TestForApi
//
//  Created by Habibur Rahman on 16/7/24.
//

import SwiftUI

struct BottomDetails: View {
    // @StateObject var vm : BottomMovieDetailsVM = BottomMovieDetailsVM()
   
    @StateObject var vm = BottomMovieDetailsVM()

    @State var isViewed = false
    @Binding var movie: MovieApiModel?
    @Binding var casts: [Cast]
    @Binding var similarMovie : [CommonItemData] 
    
    var movieId = 1022789
    var onMovieItemPressed : (Genre) -> Void
    var onPressed : (Cast) -> Void

//    init(movie : MovieApiModel?, casts : [Cast]){
//        _vm = StateObject(wrappedValue: BottomMovieDetailsVM(movieData: movie, casts: casts))
//    }
//
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                movieTitleWithBookMark
                ratingAndScoreText
                textOnCapsule
                dateTimeAndLanguage
                description

                castView
                  
                
                similarView
                // .padding(.bottom, 100)
                Spacer()
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .ignoresSafeArea()
    }

    func getCastProfileImage(imageName: String?) -> String {
        if let image = imageName {
            let imagePath = "https://image.tmdb.org/t/p/original\(image)"
            print("U>> image \(imagePath)")
            return imagePath
        }
        return ""
    }
}

#Preview {
    BottomDetails(movie: .constant(DummyDataUtils.dummyMovieData01), casts: .constant(DummyCastData.castList), similarMovie: .constant([]) ,onMovieItemPressed: { _ in }, onPressed: { _ in })
   
}

extension BottomDetails {
    var movieTitleWithBookMark: some View {
        HStack {
            Text(movie?.title ?? "noData")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.pink)
                .lineLimit(2)

            Spacer()

            Image(systemName: "bookmark")
                .resizable()
                .frame(width: 20, height: 25)
        }
    }
}

extension BottomDetails {
    var ratingAndScoreText: some View {
        HStack {
            Text(movie?.ratingText ?? "No Rating").foregroundColor(.yellow)
            Text(movie?.scoreText ?? "0")

            if let imdbId = movie?.imdbID {
                ImdbButton(imdbId: .constant(imdbId))
            }

            Spacer()
        }
    }
}

extension BottomDetails {
  
    var textOnCapsule: some View {
        
        HStack {
            if let genras = movie?.genres {
              
                HStack(spacing: 10) {
                    ForEach(genras) { genra in
                        Capsule()
                            .fill(Color.blueis)
                            .frame(width: 70, height: 27)
                            .overlay(
                                Text(genra.name ?? "")
                            )
                            .onTapGesture {
                               onMovieItemPressed(genra)
                            }
                    }
                }
            }

            Spacer()
        }
        .font(.caption)
        .foregroundStyle(.blue)
    }
}

extension BottomDetails {
    var dateTimeAndLanguage: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center) {
                Text("Release Date")
                    .foregroundStyle(.gray)
                Text(movie?.releaseDate ?? "No Data")
            }

            VStack(alignment: .center) {
                Text("Length")
                    .foregroundStyle(.gray)
                Text(movie?.durationText ?? "120 Min")
            }

            VStack(alignment: .center) {
                Text("Language")
                    .foregroundStyle(.gray)

                Text(movie?.originalLanguage ?? "NoData")
            }

            Spacer()
        }
    }
}

extension BottomDetails {
    var description: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Description")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()
            }

            Text(movie?.overview ?? "noOverview")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(isViewed ? 20 : 3)
            Button(isViewed ? "Read Less" : "Read More") {
                isViewed.toggle()
            }
            .font(.system(size: 15, weight: .semibold))
        }
        .font(.system(size: 15))
        // .background(.pink)
    }
}

extension BottomDetails {
    
    var castView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Cast")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
            }

            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(casts) { cast in

                        let imagePath = getCastProfileImage(imageName: cast.profilePath)

                        CastView(name: cast.name ?? "noData", profilePath: imagePath)
                            .onTapGesture {
                                onPressed(cast)
                            }
                    }
                }
            }
        }
        .onAppear {
            // $vm.loadData(movieId: movieId)
        }
    }
}

extension BottomDetails {
    var similarView: some View {
        
        HorizontalMovieListWithTitle(movies: similarMovie, title: "Recommend", onMovieItemPressed: { movie in
            vm.selectedMovie = movie.id
            //vm.goMovieDetailsPage = true
        })

    }
}
