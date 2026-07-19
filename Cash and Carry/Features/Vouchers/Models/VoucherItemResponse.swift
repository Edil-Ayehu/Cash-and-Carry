//
//  VoucherItemResponse.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct VoucherItemResponse: Decodable, Identifiable, Hashable {

    let id: String
    let quantity: Int
    let product: VoucherProductResponse

    enum CodingKeys: String, CodingKey {
        case id
        case quantity
        case product
    }
}
