//
//  ProfileServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

final class ProfileServiceImpl: ProfileService {
    private var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getProfile() async throws -> ProfileResponse {
        try await apiClient.request(
            endpoint: APIEndpoints.profile
        )
    }
    
    func changePassword(
        request: ChangePasswordRequest
    ) async throws -> ChangePasswordResponse {
        try await apiClient.request(
            endpoint: APIEndpoints.changePassword,
            method: "POST",
            body: request
        )
    }
}
