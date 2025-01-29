//
//  UserModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

// MARK: - Welcome
struct UserWelcome: Codable {
    let records: [UserRecord]
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
