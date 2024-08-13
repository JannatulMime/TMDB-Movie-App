//
//  SearchDataModel.swift
//  TestForApi
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation


struct MovieSearchApiDataModel : Codable {
    let page: Int?
    let results: [MovieApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
