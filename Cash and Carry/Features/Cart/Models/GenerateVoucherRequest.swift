//
//  GenerateVoucherRequest.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

struct GenerateVoucherRequest: Encodable {
    let items: [GenerateVoucherItemRequest]
}
