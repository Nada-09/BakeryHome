//
//  CoursesModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 21/07/1446 AH.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let records: [Record]
}

// MARK: - Record
struct Record: Codable {
    let id: String
    let createdTime: CreatedTime
    let fields: Fields
}

enum CreatedTime: String, Codable {
    case the20250107T224048000Z = "2025-01-07T22:40:48.000Z"
}

// MARK: - Fields
struct Fields: Codable {
    let locationLongitude: Double
    let locationName: String
    let locationLatitude: Double
    let title: String
    let level: Level
    let endDate: Double
    let id, chefID, description: String
    let startDate: Double

    enum CodingKeys: String, CodingKey {
        case locationLongitude = "location_longitude"
        case locationName = "location_name"
        case locationLatitude = "location_latitude"
        case title, level
        case endDate = "end_date"
        case id
        case chefID = "chef_id"
        case description
        case startDate = "start_date"
    }
}

enum Level: String, Codable {
    case advance = "advance"
    case beginner = "beginner"
    case intermediate = "intermediate"
}
