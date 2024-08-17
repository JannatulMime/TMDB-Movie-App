//
//  ApiClient.swift
//  TestForApi
//
//  Created by Habibur Rahman on 17/8/24.
//

import Foundation

let TMDBToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGE3MTA0ZTRlMDJjYWY4Njk3MDBhMjY1Nzg4NWZhYSIsIm5iZiI6MTcxOTcxNDU5NC45OTY1NjYsInN1YiI6IjVhMWQ2YTRhYzNhMzY4MGI5NjA2NjUzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HIoTPfp29xiyuMn34T_MRaEThANeqvKBPWrE-azpp-4"
let BaseUrl = "https://api.themoviedb.org/"
let version = "3"


enum ApiType{
    case POST
    case GET
}

class APIHelper {
    
    static let shared = APIHelper()
    
    private init (){}
    
    private func getUrlQueryComponent(url: String, queries: [String: String]) -> URLComponents? {
        guard var urlComponents = URLComponents(string: url) else {
            return nil
        }

        var queryItems = [URLQueryItem]()

        for (key, value) in queries {
            queryItems.append(URLQueryItem(name: key, value: value))
        }

        urlComponents.queryItems = queryItems
        return urlComponents
    }
    
    private func prepareFormDataInRequest(request: inout URLRequest, formData: [String: Any]?) {
        guard let formData = formData else {
            return // request
        }

        let parameterArray = formData.map { key, value -> String in
            "\(key)=\(value)"
        }

        let formDataString = parameterArray.joined(separator: "&")
        let formDataInData = formDataString.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = formDataInData
    }
    
    func prepareRequest(apiType : ApiType, url: String ,
                        queries: [String: String] = [:],
                        formData: [String: Any] = [:],
                        needAuth : Bool = true) throws -> URLRequest {
        
       
        let urlComponents = getUrlQueryComponent(url: url, queries: queries)
        guard let url = urlComponents?.url else {
            throw ApiError.InvalidURL
        }
     
        
        var request = URLRequest(url: url)
        prepareFormDataInRequest(request: &request, formData: formData)
        
        
        if needAuth {
            request.setValue("Bearer \(TMDBToken)", forHTTPHeaderField:"Authorization")
        }
        
        return request
       
    }
    
}

