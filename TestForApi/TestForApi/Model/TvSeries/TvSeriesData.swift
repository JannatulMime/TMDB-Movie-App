//
//  TvSeriesData.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import Foundation


struct TvSeriesListApiResponse: Codable {
   // let dates: Dates?
    let page: Int?
    let results: [TvSeriesApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        //case dates
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension TvSeriesListApiResponse {
    func getCommonItemDataList() -> [CommonItemData] {
        guard let results = results , results.count > 0 else {return [CommonItemData]()}
        var dataList = [CommonItemData]()
        for result in results {
            dataList.append(result.commonItemData)
        }
        return dataList
    }
}


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
    var imdbID: String?
    var originCountry: [String]?
    var originalLanguage, originalName, overview: String?
    var popularity: Double?
    var posterPath, firstAirDate, name: String?
    var voteAverage: Double?
    var voteCount, runtime: Int?
    var spokenLanguages: [SpokenLanguage]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case genreIDS = "genre_ids"
        case id
        case imdbID = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount, runtime
        case spokenLanguages = "spoken_languages"
    }
    
   
    var commonItemData : CommonItemData {
        return CommonItemData(id: id  , itemType: .series, name: originalName , details: overview , posterPath: posterPath, backdropPath: backdropPath, voteAverage: voteAverage)
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


