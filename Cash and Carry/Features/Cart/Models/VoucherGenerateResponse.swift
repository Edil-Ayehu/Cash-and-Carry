//
//  VoucherGenerateResponse.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

struct VoucherGenerateResponse: Codable {
    let code: String


    enum CodingKeys: String, CodingKey {
        case code
    }
}
