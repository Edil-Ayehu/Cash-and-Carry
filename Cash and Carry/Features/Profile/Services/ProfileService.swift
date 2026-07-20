//
//  ProfileService.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

protocol ProfileService {
    func getProfile() async throws -> ProfileResponse
}
