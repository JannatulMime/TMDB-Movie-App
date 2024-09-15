//
//  MovieSearchApiDataModel.swift
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

extension MovieSearchApiDataModel {
    func getCommonItemDataList() -> [CommonItemData] {
        guard let results = results , results.count > 0 else {return [CommonItemData]()}
        var dataList = [CommonItemData]()
        for result in results {
            dataList.append(result.commonItemData)
        }
        return dataList
    }
}

