//
//  MyVoucherServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class MyVoucherServiceImpl: MyVoucherService {
    private var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchMyVouchers() async throws -> [MyVoucherResponse] {
        try await apiClient.request(
            endpoint: APIEndpoints.myVouchers
        )
    }
}
