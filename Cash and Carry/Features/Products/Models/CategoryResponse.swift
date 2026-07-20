//
//  CategoryResponse.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

struct CategoryResponse: Decodable, Identifiable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
