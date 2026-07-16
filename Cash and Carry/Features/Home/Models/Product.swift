//
//  Product.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: String
    let price: Double
    let image: String
}
