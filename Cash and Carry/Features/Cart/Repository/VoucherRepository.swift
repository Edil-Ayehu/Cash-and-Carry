//
//  VoucherRepository.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

protocol VoucherRepository {
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> VoucherGenerateResponse
}
