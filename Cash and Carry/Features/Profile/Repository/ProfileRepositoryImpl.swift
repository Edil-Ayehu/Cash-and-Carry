//
//  ProfileRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

final class ProfileRepositoryImpl: ProfileRepository {
    private var profileService: ProfileService
    
    init(profileService: ProfileService) {
        self.profileService = profileService
    }
    
    func getProfile() async throws -> ProfileResponse {
        try await profileService.getProfile()
    }
    
    func changePassword(
        oldPassword: String,
        newPassword: String
    ) async throws -> ChangePasswordResponse {
        let request = ChangePasswordRequest(
            oldPassword: oldPassword,
            newPassword: newPassword
        )
        
        let response = try await profileService.changePassword(
            request: request
        )
        
        return response
    }
}
