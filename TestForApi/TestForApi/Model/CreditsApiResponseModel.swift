//
//  CreditsApiResponseModel.swift
//  TestForApi
//
//  Created by Habibur Rahman on 9/7/24.
//

import Foundation


// MARK: - Welcome
struct MovieCreditApiResponseModel: Codable {
    var id: Int?
    var cast, crew: [Cast]?
}

// MARK: - Cast
struct Cast: Codable, Identifiable {
    var adult: Bool?
    var gender, id: Int?
    var name, originalName: String?
    var popularity: Double?
    var profilePath: String?
    var castID: Int?
    var character: String?
    var creditID: String?
    var order: Int?
   // let department: Department?
    var job: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
      //  case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, job
    }
}
