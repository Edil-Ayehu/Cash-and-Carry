//
//  MyVoucherResponse.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct MyVoucherResponse: Codable, Identifiable, Hashable {

    let id: String
    let code: String
    let status: String
    let totalAmount: Double
    let items: [VoucherItemResponse]


    enum CodingKeys: String, CodingKey {
        case id
        case code
        case status
        case totalAmount
        case items
    }
}
