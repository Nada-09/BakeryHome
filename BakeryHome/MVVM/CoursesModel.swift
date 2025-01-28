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
    let records: [Record]?
    let id, createdTime: String? // هذه الحقول مطلوبة لبوستمان الحجز
    let fields: Fields?
    let error: Error
}

// MARK: - Record
struct Record: Codable {
    let id: String
    let createdTime: String // تم تغييرها من `CreatedTime` إلى `String` لتعامل مع أي تاريخ
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
    // الحقول المشتركة
    let id: String?
    let name, email, password: String
    
    // الحقول الجديدة من الموديل الأول
    let locationLongitude: Double?
    let locationName: String?
    let locationLatitude: Double?
    let title: String?
    let imageURL: String?
    let level: Level?
    let endDate: Int?
    let chefID: String?
    let description: String?
    let startDate: Int?
    
    
    // الحقول الإضافية من الموديل الثاني
    let courseID: String?
    let userID: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        // الحقول المشتركة
        case id, name, email, password
        
        // الحقول الجديدة من الموديل الأول
        case locationLongitude = "location_longitude"
        case locationName = "location_name"
        case locationLatitude = "location_latitude"
        case title
        case imageURL = "image_url"
        case level
        case endDate = "end_date"
        case chefID = "chef_id"
        case description
        case startDate = "start_date"
        
        // الحقول الإضافية من الموديل الثاني
        case courseID = "course_id"
        case userID = "user_id"
        case status
    }
}

// MARK: - Level
enum Level: String, Codable {
    case advance = "advance"
    case beginner = "beginner"
    case intermediate = "intermediate"
}

// MARK: - Error
struct Error: Codable {
    let type, message: String
}

//
//import Foundation
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let records: [Record]
//}
//
//// MARK: - Record
//struct Record: Codable {
//    let id: String
//    let createdTime: CreatedTime
//    let fields: Fields
//}
//
//enum CreatedTime: String, Codable {
//    case the20250107T224048000Z = "2025-01-07T22:40:48.000Z"
//}
//
//// MARK: - Fields
//struct Fields: Codable {
//    let locationLongitude: Double
//    let locationName: String
//    let locationLatitude: Double
//    let title: String
//    let imageURL: String
//    let level: Level
//    let endDate: Int
//    let id, chefID, description: String
//    let startDate: Int
//    let password, id, name, email: String
//    
//    
//
//    enum CodingKeys: String, CodingKey {
//        case locationLongitude = "location_longitude"
//        case locationName = "location_name"
//        case locationLatitude = "location_latitude"
//        case title
//        case imageURL = "image_url"
//        case level
//        case endDate = "end_date"
//        case id
//        case chefID = "chef_id"
//        case description
//        case startDate = "start_date"
//    }
//}
//
//enum Level: String, Codable {
//    case advance = "advance"
//    case beginner = "beginner"
//    case intermediate = "intermediate"
//}
//
