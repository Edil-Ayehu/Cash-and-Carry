//
//  MyVoucherRepository.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

protocol MyVoucherRepository {
    func fetchMyVouchers() async throws -> [MyVoucherResponse]
}
