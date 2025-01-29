//
//  ChefsModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

// MARK: - Welcome
struct BookingWelcome: Codable {
    let id, createdTime: String
    let fields: BookingFields
}

// MARK: - Fields
struct BookingFields: Codable {
    let courseID, userID, status: String

    enum CodingKeys: String, CodingKey {
        case courseID = "course_id"
        case userID = "user_id"
        case status
    }
}
