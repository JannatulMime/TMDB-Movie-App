//
//  ApiManager.swift
//  TestForApi
//
//  Created by Habibur Rahman on 3/7/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

class ApiManager{
    
    func request<T: Decodable>(url: String) async throws -> T {
        
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGE3MTA0ZTRlMDJjYWY4Njk3MDBhMjY1Nzg4NWZhYSIsIm5iZiI6MTcxOTcxNDU5NC45OTY1NjYsInN1YiI6IjVhMWQ2YTRhYzNhMzY4MGI5NjA2NjUzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HIoTPfp29xiyuMn34T_MRaEThANeqvKBPWrE-azpp-4"
        
        guard let url = URL(string:  url) else {
            throw DataError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
      
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        let convertedString = String(data: data, encoding: .utf8)
       // print(convertedString)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    
    func request<T: Decodable>(url: String, searchQuery : String) async throws -> T {
        
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGE3MTA0ZTRlMDJjYWY4Njk3MDBhMjY1Nzg4NWZhYSIsIm5iZiI6MTcxOTcxNDU5NC45OTY1NjYsInN1YiI6IjVhMWQ2YTRhYzNhMzY4MGI5NjA2NjUzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HIoTPfp29xiyuMn34T_MRaEThANeqvKBPWrE-azpp-4"

        
        guard var components =  URLComponents(string: url) else {
            throw DataError.invalidURL
        }
       // var components = URLComponents(string: url)

       
        components.queryItems = [
            URLQueryItem(name: "query", value: searchQuery)
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
    
      //  components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
      
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        let convertedString = String(data: data, encoding: .utf8)
        // print(convertedString)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}




