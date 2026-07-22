//
//  GenerateVoucherItemRequest.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

struct GenerateVoucherItemRequest: Encodable {
    let productId: String
    let quantity: Int
}
