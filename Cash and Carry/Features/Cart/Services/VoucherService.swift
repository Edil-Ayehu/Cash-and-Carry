//
//  VoucherService.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

protocol VoucherService {
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> VoucherGenerateResponse
}
