//
//  VoucherRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

import Foundation

final class VoucherRepositoryImpl: VoucherRepository {
    private var voucherService: VoucherService
    
    init(voucherService: VoucherService) {
        self.voucherService = voucherService
    }
    
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> VoucherGenerateResponse {
        try await voucherService.generateVoucher(
            request: request
        )
    }
}
