//
//  TvSeriesSearchApiDataModel.swift
//  TestForApi
//
//  Created by Habibur Rahman on 15/9/24.
//

import Foundation

struct TvSeriesSearchApiDataModel : Codable {
    let page: Int?
    let results: [TvSeriesApiModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

extension TvSeriesSearchApiDataModel {
    func getCommonItemDataList() -> [CommonItemData] {
        guard let results = results , results.count > 0 else {return [CommonItemData]()}
        var dataList = [CommonItemData]()
        for result in results {
            dataList.append(result.commonItemData)
        }
        return dataList
    }
}
