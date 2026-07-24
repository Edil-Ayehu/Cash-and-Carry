//
//  FavoriteResponse.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation


struct FavoriteResponse: Codable, Identifiable, Hashable {

    let id: String
    let name: String?
    let storeId: String?
    let createdAt: String
    let items: [FavoriteItemResponse]


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case storeId
        case createdAt
        case items
    }
}
