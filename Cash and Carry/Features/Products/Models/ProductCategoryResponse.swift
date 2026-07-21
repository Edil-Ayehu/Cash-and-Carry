//
//  ProductCategoryResponse.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct ProductCategoryResponse: Codable, Identifiable, Equatable, Hashable {

    let id: String
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
    
}
