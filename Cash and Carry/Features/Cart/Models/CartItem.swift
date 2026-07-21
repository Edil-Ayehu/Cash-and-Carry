//
//  CartItem.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

struct CartItem: Codable, Identifiable, Hashable {
    var id: String { product.id }
    let product: ProductResponse
    var quantity: Int
}

