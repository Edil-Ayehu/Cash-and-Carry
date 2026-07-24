//
//  FavoriteItemResponse.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation


struct FavoriteItemResponse: Codable, Identifiable, Hashable {

    var id: String {
        productId
    }

    let productId: String
    let quantity: Int
    let product: FavoriteProductResponse


    enum CodingKeys: String, CodingKey {
        case productId
        case quantity
        case product
    }
}
