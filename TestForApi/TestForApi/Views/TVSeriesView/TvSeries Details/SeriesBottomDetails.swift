//
//  SeriesBottomDetails.swift
//  TestForApi
//
//  Created by Habibur Rahman on 26/8/24.
//

//import SwiftUI
//
//struct SeriesBottomDetails: View {
//    
//    @StateObject var vm = SeriesBottomDetailsVM()
//    @State var isViewed = false
//    
//    @Binding var tvSeries : TvSeriesApiModel?
//    @Binding var casts: [Cast]
//    @Binding var similarTvSeries : [CommonItemData]
//
//    var seriesId = 1022789
//    var onSeriesItemPressed : (Genre) -> Void
//    var onPressed : (Cast) -> Void
//
//
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack(spacing: 10) {
//                tvSeriesTitleWithBookMark
//                seriesRatingAndScoreText
//                genraListView
//                tvDateTimeAndLanguage
//                description
//
//                castView
//                
//                similarView
//                    .padding(.bottom, 50)
//
//                Spacer()
//            }
//        }
//        .padding()
//        .background(.black)
//        .cornerRadius(30)
//        .ignoresSafeArea()
//    }
//
//    func getCastProfileImage(imageName: String?) -> String {
//        if let image = imageName {
//            let imagePath = "https://image.tmdb.org/t/p/original\(image)"
//            print("U>> image \(imagePath)")
//            return imagePath
//        }
//        return ""
//    }
//}
//#Preview {
//    SeriesBottomDetails (tvSeries: .constant( DummyTvSeries.dummyTvSeries1), casts: .constant(DummyCastData.castList), similarTvSeries: .constant([]), onSeriesItemPressed: { _ in }, onPressed: { _ in })
//   
//}
//
//extension SeriesBottomDetails {
//    var tvSeriesTitleWithBookMark: some View {
//        HStack {
//            Text(tvSeries?.originalName ?? "noData")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundStyle(.pink)
//                .lineLimit(2)
//
//            Spacer()
//
//            Image(systemName: "bookmark")
//                .resizable()
//                .frame(width: 20, height: 25)
//                .foregroundStyle(.yellow)
//        }
//    }
//}
//
//extension SeriesBottomDetails  {
//    var seriesRatingAndScoreText: some View {
//        HStack {
//            Text(tvSeries?.ratingText ?? "No Rating").foregroundColor(.yellow)
//            Text(tvSeries?.scoreText ?? "0")
//                .foregroundStyle(.white)
//            
////            if let imdbId = tvSeries?.imdbID {
////                ImdbButton(imdbId: .constant(imdbId))
////            }
//            
//            Spacer()
//        }
//    }
//}
//
//extension SeriesBottomDetails  {
//  
//    var genraListView: some View {
//        
//        HStack {
//            if let genras = tvSeries?.genres {
//                GenraListView(genras: genras)
//            }
//            Spacer()
//        }
//    }
//}
//
//extension SeriesBottomDetails  {
//    var tvDateTimeAndLanguage: some View {
//        HStack(spacing: 20) {
//            VStack(alignment: .center) {
//                Text("Release Date")
//                    .foregroundStyle(.gray)
//                Text(tvSeries?.firstAirDate ?? "No Data")
//                    .foregroundStyle(.white)
//            }
//
//            VStack(alignment: .center) {
//                Text("Length")
//                    .foregroundStyle(.gray)
//                Text(tvSeries?.durationText ?? "120 Min")
//                    .foregroundStyle(.white)
//            }
//
//            VStack(alignment: .center) {
//                Text("Language")
//                    .foregroundStyle(.gray)
//
//                Text(tvSeries?.originalLanguage ?? "NoData")
//                    .foregroundStyle(.white)
//            }
//
//            Spacer()
//        }
//    }
//}
//
//extension SeriesBottomDetails  {
//    var description: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text("Description")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundStyle(.white)
//
//                Spacer()
//            }
//
//            Text(tvSeries?.overview ?? "noOverview")
//                .foregroundStyle(.gray)
//                .multilineTextAlignment(.leading)
//                .lineLimit(isViewed ? 20 : 3)
//            Button(isViewed ? "Read Less" : "Read More") {
//                isViewed.toggle()
//            }
//            .font(.system(size: 15, weight: .semibold))
//        }
//        .font(.system(size: 15))
//        // .background(.pink)
//    }
//}
//
//extension SeriesBottomDetails  {
//    var castView: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Text("Cast")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundStyle(.white)
//                
//                Spacer()
//            }
//
//            ScrollView(.horizontal, showsIndicators: false) {
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
//           // $vm.loadData(movieId: movieId)
//        }
//    }
//}
//
//
//extension SeriesBottomDetails {
//    var similarView: some View {
//        
//        HorizontalMovieListWithTitle(movies: similarTvSeries, title: "Recommend", onMovieItemPressed: { series in
//            vm.selectedSeries = series.id
//            vm.goTvSeriesDetailsPage = true
//        })
//        .navigationDestination(isPresented: $vm.goTvSeriesDetailsPage) {
//            MovieDetailsView(movieId: vm.selectedSeries ?? 0)
//        }
//        .navigationBarBackButtonHidden(true)
//        
//
//    }
//}
//
