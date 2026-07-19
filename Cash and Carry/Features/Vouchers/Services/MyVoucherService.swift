//
//  MyVoucherService.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

protocol MyVoucherService {
    func fetchMyVouchers() async throws -> [MyVoucherResponse]
}
