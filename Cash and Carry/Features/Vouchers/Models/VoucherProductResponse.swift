//
//  VoucherProductResponse.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct VoucherProductResponse: Decodable, Identifiable, Hashable {

    let id: String
    let name: String
    let description: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
    }
}
