//
//  MovieApiService.swift
//  TestForApi
//
//  Created by Habibur Rahman on 17/8/24.
//

import Foundation

enum MovieListType : String {
    case Popular = "popular"
    case NowPlaying = "now_playing"
    case TopRated = "top_rated"
    case upcoming = "upcoming"
    
    var itemUrl : String {
        return BaseUrl + version + "/movie/" + self.rawValue
    }
}

class MovieApiService {
    
    // static let shared = MovieApiService()
    
    let client = HttpClient()
    let apiHelper = APIHelper.shared
    
    init() {}
    
    func getMovieListByType(listType: MovieListType) async -> (MovieListApiResponse?, ApiError?) {
        
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
    
    
    
    
    func getSimilarMovie(id : Int) async -> (SimilarMovieApiResponseData?, ApiError?) {

        //https://api.themoviedb.org/3/tv/{series_id}/credits
        let url = BaseUrl + version +  "/movie/" + "\(id)/similar"
        
        do {
            let request = try apiHelper.prepareRequest(apiType: ApiType.GET, url: url, needAuth : true)
            
            let (data, _) = try await client.callApi(request: request)
            let resultObj: SimilarMovieApiResponseData? = try ResponseParser().parseResponse(from: data)
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
    func toJsonData() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }

    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

