//
//  FavoriteProductResponse.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation


struct FavoriteProductResponse: Codable, Identifiable, Hashable {

    let id: String
    let name: String
    let description: String
    let image: String
    let stockQuantity: Int
    let category: String
    let isActive: Bool
    let barcode: String?
    let stockInPrice: Double
    let createdAt: String
    let updatedAt: String


    enum CodingKeys: String, CodingKey {

        case id = "_id"
        case name
        case description
        case image
        case stockQuantity
        case category
        case isActive
        case barcode
        case stockInPrice
        case createdAt
        case updatedAt
    }
}
