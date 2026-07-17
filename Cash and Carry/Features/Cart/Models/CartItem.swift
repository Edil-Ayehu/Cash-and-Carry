//
//  CartItem.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
