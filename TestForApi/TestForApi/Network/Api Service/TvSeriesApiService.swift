//
//  TvSeriesApiService.swift
//  TestForApi
//
//  Created by Habibur Rahman on 20/8/24.
//

import Foundation

enum TvSeriesListType : String {
    case AiringToday = "airing_today"
    case OnTheAir = "on_the_air"
    case Popular = "popular"
    case TopRated = "top_rated"
    
    
    var itemUrl : String {
        return BaseUrl + version + "/tv/" + self.rawValue
    }
}

class TvSeriesApiService {
    
   // static let shared = MovieApiService()
  
    let client = HttpClient()
    let apiHelper = APIHelper.shared
    
    init() {}
 
    func getTvSeriesListByType(listType: TvSeriesListType) async -> (MovieListApiResponse?, ApiError?) {

        let url = listType.itemUrl
        
    //    let queryDic: [String: String] = ["inspectionId": inspectionId, "areaId": inspectionId]
        do {
            let request = try apiHelper.prepareRequest(apiType: ApiType.GET, url: url, needAuth : true)
            
            let (data, _) = try await client.callApi(request: request)
            let resultObj: MovieListApiResponse? = try ResponseParser().parseResponse(from: data)
            return (resultObj, nil)

        } catch {
            return (nil, error as? ApiError)
        }
    }
    
    func getSeriesDetailsBy(id : Int) async -> (TvSeriesApiModel?, ApiError?) {

        let url = BaseUrl + version +  "/tv/" + "\(id)"
        
    //    let queryDic: [String: String] = ["inspectionId": inspectionId, "areaId": inspectionId]
        do {
            let request = try apiHelper.prepareRequest(apiType: ApiType.GET, url: url, needAuth : true)
            
            let (data, _) = try await client.callApi(request: request)
            let resultObj: TvSeriesApiModel? = try ResponseParser().parseResponse(from: data)
            return (resultObj, nil)

        } catch {
            return (nil, error as? ApiError)
        }
    }
    
    func getSeriesCreditsBy(id : Int) async -> (MovieCreditApiResponseModel?, ApiError?) {

        //https://api.themoviedb.org/3/tv/{series_id}/credits
        let url = BaseUrl + version +  "/tv/" + "\(id)/credits"
        
    //    let queryDic: [String: String] = ["inspectionId": inspectionId, "areaId": inspectionId]
        do {
            let request = try apiHelper.prepareRequest(apiType: ApiType.GET, url: url, needAuth : true)
            
            let (data, _) = try await client.callApi(request: request)
            let resultObj: MovieCreditApiResponseModel? = try ResponseParser().parseResponse(from: data)
            return (resultObj, nil)

        } catch {
            return (nil, error as? ApiError)
        }
    }
    
    
    func searchMovie(searchKeyword: String) async -> (MovieSearchApiDataModel?, ApiError?) {

        let url = BaseUrl + version + "/search/movie"
        
        let queryDic: [String: String] = ["query": searchKeyword]
        do {
            let request = try apiHelper.prepareRequest(apiType: ApiType.GET,
                                                       url: url,
                                                       queries : queryDic,
                                                       needAuth : true)
            
            let (data, _) = try await client.callApi(request: request)
            let resultObj: MovieSearchApiDataModel? = try ResponseParser().parseResponse(from: data)
            return (resultObj, nil)

        } catch {
            return (nil, error as? ApiError)
        }
    }
}

extension Encodable {
    func toTvJsonData() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }

    func asTvDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
    
