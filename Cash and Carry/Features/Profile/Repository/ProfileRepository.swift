//
//  ProfileRepository.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

protocol ProfileRepository {
    func getProfile() async throws -> ProfileResponse
    
    func changePassword(
        oldPassword: String,
        newPassword: String
    ) async throws -> ChangePasswordResponse
}
