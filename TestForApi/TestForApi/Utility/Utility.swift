//
//  Utility.swift
//  TestForApi
//
//  Created by Habibur Rahman on 12/7/24.
//

import Foundation

class Utility{
    
    static let tmdbImageBaseUrl =  "https://image.tmdb.org/t/p/original"
    
    static func getWebImagePath(imageName : String) -> String {
        let path = tmdbImageBaseUrl + imageName
        return path
    }
    
}
