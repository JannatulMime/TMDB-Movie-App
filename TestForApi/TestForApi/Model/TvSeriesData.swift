//
//  TvSeriesData.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import Foundation

struct TvSeriesApiResponseModel: Codable {
    let page: Int?
    let results: [TvSeriesApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TvSeriesApiModel: Codable, Identifiable {
    var adult: Bool?
    var backdropPath: String?
    var genres: [Genre]?
    var genreIDS: [Int]?
    var id: Int?
    var originCountry: [String]?
    var originalLanguage, originalName, overview: String?
    var popularity: Double?
    var posterPath, firstAirDate, name: String?
    var voteAverage: Double?
    var voteCount, runtime: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres = "genre"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount, runtime
    }
    
    struct Genre: Codable, Identifiable {
        let id: Int?
        let name: String?
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
        return TvSeriesApiModel.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
}


