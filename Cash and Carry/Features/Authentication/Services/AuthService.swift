//
//  AuthService.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

protocol AuthService {
    func login(
        request: LoginRequest
    ) async throws -> LoginResponse
}


final class AuthServiceImpl: AuthService {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func login(
        request: LoginRequest
    ) async throws -> LoginResponse {
        try await apiClient.request(
            endpoint: APIEndpoints.login,
            method: "POST",
            body: request
        )
    }
}
