//
//  ProfileRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

final class ProfileRepositoryImpl: ProfileRepository {
    private var profileService: ProfileService
    private var profileLocalDataSource: ProfileLocalDataSource
    
    init(
        profileService: ProfileService,
        profileLocalDataSource: ProfileLocalDataSource
    ) {
        self.profileService = profileService
        self.profileLocalDataSource = profileLocalDataSource
    }
    
    func getProfile() async throws -> ProfileResponse {
        let profile = try await profileService.getProfile()
        
        profileLocalDataSource.saveProfile(profile)
        
        return profile
    }
    
    func getCachedProfile() -> ProfileResponse? {
        profileLocalDataSource.getProfile()
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
    
    func editProfile(
        name: String,
        email: String?
    ) async throws -> EditProfileResponse {
        let request = EditProfileRequest(
            name: name,
            email: email
        )
        
        let response = try await profileService.editProfile(request: request)
        
        return response
    }
}
