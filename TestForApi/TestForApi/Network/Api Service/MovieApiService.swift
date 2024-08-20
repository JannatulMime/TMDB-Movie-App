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
    
//    func request<T: Decodable>(url: String, searchQuery : String) async throws -> T {
//        
//        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGE3MTA0ZTRlMDJjYWY4Njk3MDBhMjY1Nzg4NWZhYSIsIm5iZiI6MTcxOTcxNDU5NC45OTY1NjYsInN1YiI6IjVhMWQ2YTRhYzNhMzY4MGI5NjA2NjUzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HIoTPfp29xiyuMn34T_MRaEThANeqvKBPWrE-azpp-4"
//
//        
//        guard var components =  URLComponents(string: url) else {
//            throw DataError.invalidURL
//        }
//       // var components = URLComponents(string: url)
//
//       
//        components.queryItems = [
//            URLQueryItem(name: "query", value: searchQuery)
//        ]
//
//        guard let url = components.url else {
//            throw URLError(.badURL)
//        }
//        
//    
//      //  components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
//
//        
//        var request = URLRequest(url: url)
//        request.setValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
//        
//        let (data, response) = try await URLSession.shared.data(for: request)
//        
//      
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw DataError.invalidResponse
//        }
//        let convertedString = String(data: data, encoding: .utf8)
//        // print(convertedString)
//        
//        return try JSONDecoder().decode(T.self, from: data)
//    }

//    func updateMainInspectionActionAsync(inspectionId: String, statusType: InspectionActionType) async -> (CommonApiResponse?, ApiError?) {
//
//        let url = baseUrl + "inspections/updateMainInspection.php"
//        let status = statusType == .Resume ? "inProgress" : statusType.rawValue
//
//        var parameters: [String: Any] = [
//            "inspectionId": inspectionId
//        ]
//
//        if statusType == .cancel {
//            parameters["active"] = "0"
//        } else {
//            parameters["status"] = status
//        }
//
//        do {
//            let (data, _) = try await client.post(url: url, body: nil, formData: parameters)
//            let resultObj = try JSONDecoder().decode(CommonApiResponse.self, from: data)
//            return (resultObj, nil)
//
//        } catch {
//            return (nil, error as? ApiError)
//        }
//    }

  
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

