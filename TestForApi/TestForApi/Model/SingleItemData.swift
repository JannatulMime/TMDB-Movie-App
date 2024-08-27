//
//  SingleItemData.swift
//  TestForApi
//
//  Created by Habibur Rahman on 21/8/24.
//

import Foundation

enum ItemType {
    case movie
    case series
}

struct CommonItemData : Identifiable {
    
    var id : Int?
    var itemType : ItemType?
    var name : String?
    var details : String?
    var posterPath : String?
    var backdropPath : String?
    var voteAverage : Double?
    
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0.0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
}
