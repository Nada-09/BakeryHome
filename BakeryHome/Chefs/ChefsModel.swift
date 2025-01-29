//
//  ChefsModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

// MARK: - Welcome
struct ChefWelcome: Codable {
    let records: [ChefRecord]
}

// MARK: - Record
struct ChefRecord: Codable {
    let id, createdTime: String
    let fields: ChefFields
}

// MARK: - Fields
struct ChefFields: Codable {
    let password, id, name, email: String
}
