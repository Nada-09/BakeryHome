//
//  UserModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

// MARK: - Unified Model
struct UserResponse: Codable {
    let records: [UserRecord]?
    let id, createdTime: String?
    let fields: UserFields?
    let error: UserError?
}

// MARK: - Record
struct UserRecord: Codable {
    let id, createdTime: String
    let fields: UserFields
}

// MARK: - Fields
struct UserFields: Codable {
    let id: String?
    let name, email, password: String
}

// MARK: - Error
struct UserError: Codable {
    let type, message: String
}

