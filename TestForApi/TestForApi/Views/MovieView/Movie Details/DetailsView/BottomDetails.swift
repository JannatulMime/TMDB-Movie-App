//
//  BottomDetails.swift
//  TestForApi
//
//  Created by Habibur Rahman on 16/7/24.
//

import SwiftUI

struct BottomDetails: View {
    
    @StateObject var vm = BottomMovieDetailsVM()

    @State var isViewed = false
    var itemType : ItemType
    @Binding var movie: MovieApiModel?
    @Binding var series: TvSeriesApiModel?
    @Binding var casts: [Cast]
    @Binding var similarMovie : [CommonItemData] 
    
    
    @State private var selectedMovie: Int?
    @State private var goMovieDetailsPage: Bool = false
    var movieId = 1022789
    var onMovieItemPressed : (Genre) -> Void
    var onPressed : (Cast) -> Void

//    init(movie : MovieApiModel?, casts : [Cast]){
//        _vm = StateObject(wrappedValue: BottomMovieDetailsVM(movieData: movie, casts: casts))
//    }
//
    var body: some View {
//        ScrollView(showsIndicators: false) {
//            
//
//        }
        VStack(spacing: 10) {
            movieTitleWithBookMark
            ratingAndScoreText
            textOnCapsule
            dateTimeAndLanguage
            description

            castView
              
            
            similarView
            .padding(.bottom, 50)
            Spacer()
        }
        .padding()
        .background(.black)
        .cornerRadius(30)
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
    
    func getTitle() -> String?{
        return itemType == .movie ? movie?.title : series?.name
    }
    
    func getRating() -> String? {
        return itemType == .movie ? movie?.ratingText : series?.ratingText
    }
    
    func getScore() -> String? {
        return itemType == .movie ? movie?.scoreText : series?.scoreText
    }
    
    func getReleaseDate() -> String? {
        return itemType == .movie ? movie?.releaseDate  : series?.firstAirDate
    }
    
    func getDuration() -> String? {
        return itemType == .movie ? movie?.durationText  : series?.durationText
    }
    
    func getLanguage() -> String? {
        return itemType == .movie ? movie?.originalLanguage  : series?.originalLanguage
    }
    
    func getOverview() -> String? {
        return itemType == .movie ? movie?.overview : series?.overview
    }
    
    func getGenre() -> [Genre]? {
       return itemType == .movie ? movie?.genres : series?.genres
    }
}

#Preview {
    BottomDetails(itemType : .movie,
                  movie:
            .constant(DummyDataUtils.dummyMovieData01),
                  series: .constant(DummyTvSeries.dummyTvSeries1), casts: .constant(DummyCastData.castList),
                  similarMovie: .constant([]) ,onMovieItemPressed: { _ in }, onPressed: { _ in })
   
}

extension BottomDetails {
    var movieTitleWithBookMark: some View {
        HStack {
            Text(getTitle() ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.teal)
                .lineLimit(2)

            Spacer()

            Image(systemName: "bookmark")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundStyle(.yellow)
        }
    }
}

extension BottomDetails {
    var ratingAndScoreText: some View {
        HStack {
            Text(getRating() ?? "No Rating")
                .foregroundColor(.yellow)
            Text(getScore() ?? "0")
                .fontWeight(.bold)
                .foregroundStyle(.white)

            if let imdbId = movie?.imdbID {
                ImdbButton(imdbId: .constant(imdbId))
            }

            Spacer()
        }
    }
}

extension BottomDetails {
  
    var textOnCapsule: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    if let genras = getGenre() {
                        GenraListView(genras: genras)
                    }
                    
                    Spacer()
                }
        }
        
      
    }
}

extension BottomDetails {
    var dateTimeAndLanguage: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center) {
                Text("Release Date")
                    .foregroundStyle(.white)
                Text(getReleaseDate() ?? "No Data")
                    .foregroundStyle(.gray)
            }

            VStack(alignment: .center) {
                Text("Length")
                    .foregroundStyle(.white)
                Text(getDuration() ?? "120 Min")
                    .foregroundStyle(.gray)
            }

            VStack(alignment: .center) {
                Text("Language")
                    .foregroundStyle(.white)

                Text(getLanguage() ?? "NoData")
                    .foregroundStyle(.gray)
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
                    .foregroundStyle(.white)

                Spacer()
            }

            Text(getOverview() ?? "noOverview")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(isViewed ? 20 : 3)
            
            
            Button(isViewed ? "Read Less" : "Read More") {
               
                    isViewed.toggle()
            }
            .font(.system(size: 15, weight: .semibold))
            .foregroundStyle(.teal)
            
        }
        .font(.system(size: 15))
        
    }
}

extension BottomDetails {
    
    var castView: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Cast")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                Spacer()
            }

            ScrollView(.horizontal, showsIndicators: false) {
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
            selectedMovie = movie.id
            goMovieDetailsPage = true
        })
        .navigationDestination(isPresented: $goMovieDetailsPage) {
            MovieDetailsView(movieId: selectedMovie ?? 0)
        }
         .navigationBarBackButtonHidden(true)
        

    }
}
