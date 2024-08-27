//
//  SeriesBottomDetails.swift
//  TestForApi
//
//  Created by Habibur Rahman on 26/8/24.
//

import SwiftUI

struct SeriesBottomDetails: View {
    // @StateObject var vm : BottomMovieDetailsVM = BottomMovieDetailsVM()
   
    @State var isViewed = false
    @Binding var tvSeries : TvSeriesApiModel?
   
   // @Binding var casts: [Cast]
   // @Binding var movie : MovieApiModel?

    var seriesId = 1022789
    var onSeriesItemPressed : (Genre) -> Void
   // var onPressed : (Cast) -> Void

//    init(movie : MovieApiModel?, casts : [Cast]){
//        _vm = StateObject(wrappedValue: BottomMovieDetailsVM(movieData: movie, casts: casts))
//    }
//
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                tvSeriesTitleWithBookMark
                seriesRatingAndScoreText
               // textOnCapsuleOfSeries
                tvDateTimeAndLanguage
                description

//                castView
                    .padding(.bottom, 100)

                Spacer()
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .ignoresSafeArea()
    }

//    func getCastProfileImage(imageName: String?) -> String {
//        if let image = imageName {
//            let imagePath = "https://image.tmdb.org/t/p/original\(image)"
//            print("U>> image \(imagePath)")
//            return imagePath
//        }
//        return ""
//    }
}
#Preview {
    SeriesBottomDetails (tvSeries: .constant( DummyTvSeries.dummyTvSeries1), onSeriesItemPressed: { _ in })/*, onPressed: onPressed,: { _ in })*/
    // BottomDetails( movie: <#MovieApiModel#>)
}

extension SeriesBottomDetails {
    var tvSeriesTitleWithBookMark: some View {
        HStack {
            Text(tvSeries?.name ?? "noData")
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

extension SeriesBottomDetails  {
    var seriesRatingAndScoreText: some View {
        HStack {
            Text(tvSeries?.ratingText ?? "No Rating").foregroundColor(.yellow)
            Text(tvSeries?.scoreText ?? "0")
            
//            if let imdbId = tvSeries?.imdbID {
//                ImdbButton(imdbId: .constant(imdbId))
//            }
            Spacer()
        }
    }
}

//extension SeriesBottomDetails  {
//  
//    var textOnCapsuleOfSeries: some View {
//        
//        HStack {
//            if let genras = tvSeries?.genres {
//              
//                HStack(spacing: 10) {
//                    ForEach(genras) { genra in
//                        Capsule()
//                            .fill(Color.blueis)
//                            .frame(width: 70, height: 27)
//                            .overlay(
//                                Text(genra.name ?? "")
//                            )
//                            .onTapGesture {
//                               onSeriesItemPressed(genra)
//                            }
//                    }
//                }
//            }
//
//            Spacer()
//        }
//        .font(.caption)
//        .foregroundStyle(.blue)
//    }
//}

extension SeriesBottomDetails  {
    var tvDateTimeAndLanguage: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center) {
                Text("Release Date")
                    .foregroundStyle(.gray)
                Text(tvSeries?.firstAirDate ?? "No Data")
            }

            VStack(alignment: .center) {
                Text("Length")
                    .foregroundStyle(.gray)
                Text(tvSeries?.durationText ?? "120 Min")
            }

            VStack(alignment: .center) {
                Text("Language")
                    .foregroundStyle(.gray)

                Text(tvSeries?.originalLanguage ?? "NoData")
            }

            Spacer()
        }
    }
}

extension SeriesBottomDetails  {
    var description: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Description")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()
            }

            Text(tvSeries?.overview ?? "noOverview")
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

//extension SeriesBottomDetails  {
//    var castView: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Text("Cast")
//                    .font(.title3)
//                    .fontWeight(.bold)
//                Spacer()
//            }
//
//            ScrollView(.horizontal) {
//                HStack(spacing: 10) {
//                    ForEach(casts) { cast in
//
//                        let imagePath = getCastProfileImage(imageName: cast.profilePath)
//
//                        CastView(name: cast.name ?? "noData", profilePath: imagePath)
//                            .onTapGesture {
//                                onPressed(cast)
//                            }
//                    }
//                }
//            }
//        }
//        .onAppear {
//            // $vm.loadData(movieId: movieId)
//        }
//    }
//}

