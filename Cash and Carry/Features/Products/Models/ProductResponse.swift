//
//  ProductResponse.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct ProductResponse: Decodable, Identifiable, Equatable, Hashable {

    let id: String
    let name: String
    let description: String
    let image: String
    let category: ProductCategoryResponse

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case category
    }
}
