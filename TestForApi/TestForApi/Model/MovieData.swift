//
//  MovieData.swift
//  TestForApi
//
//  Created by Habibur Rahman on 2/7/24.
//

import Foundation

struct MovieListApiResponse: Codable {
   // let dates: Dates?
    let page: Int?
    let results: [MovieApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        //case dates
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct MovieApiModel: Codable, Identifiable {
    var adult: Bool?
    var backdropPath: String?
     //  let belongsToCollection: BelongsToCollection
    var budget: Int?
    var genres: [Genre]?
    var homepage: String?
    var id: Int?
    var imdbID: String?
    var originCountry: [String]?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompany]?
    var productionCountries: [ProductionCountry]?
    var releaseDate: String?
    var revenue, runtime: Int?
    var spokenLanguages: [SpokenLanguage]?
    var status, tagline, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

       enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
         //  case belongsToCollection = "belongs_to_collection"
           case budget, genres, homepage, id
           case imdbID = "imdb_id"
           case originCountry = "origin_country"
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview, popularity
           case posterPath = "poster_path"
           case productionCompanies = "production_companies"
           case productionCountries = "production_countries"
           case releaseDate = "release_date"
           case revenue, runtime
           case spokenLanguages = "spoken_languages"
           case status, tagline, title, video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
       }
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "n/a"
        }
        return MovieApiModel.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0.0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
}

struct Genre: Codable, Identifiable {
    var id: Int?
    var name: String?
}

struct ProductionCompany: Codable {
    var id: Int?
    var logoPath: String?
    var name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountry: Codable {
    var iso3166_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

struct SpokenLanguage: Codable {
    var englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

