//
//  Voucher.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import Foundation

struct Voucher: Identifiable {
    let id = UUID()
    let code: String
    let productCount: Int
    let isRedeemed: Bool
}
