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
}
