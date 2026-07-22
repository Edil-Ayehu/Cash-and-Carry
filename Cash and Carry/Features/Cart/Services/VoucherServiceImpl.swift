//
//  VoucherServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 22/07/2026.
//

final class VoucherServiceImpl: VoucherService {
    private var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func generateVoucher(
        request: GenerateVoucherRequest
    ) async throws -> VoucherGenerateResponse {
        try await apiClient.request(
            endpoint: APIEndpoints.generateVoucher,
            method: "POST",
            body: request
        )
    }
}
