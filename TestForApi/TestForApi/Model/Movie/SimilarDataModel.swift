//
//  SimilarDataModel.swift
//  TestForApi
//
//  Created by Habibur Rahman on 29/8/24.
//

import Foundation

struct SimilarMovieApiResponseData: Codable {
    let page: Int?
    let results: [MovieApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension SimilarMovieApiResponseData {
    func getCommonItemDataList() -> [CommonItemData] {
        guard let results = results , results.count > 0 else {return [CommonItemData]()}
        var dataList = [CommonItemData]()
        for result in results {
            dataList.append(result.commonItemData)
        }
        return dataList
    }
}

// MARK: - Result
//struct Result: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage: OriginalLanguage
//    let originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case ja = "ja"
//}
//
