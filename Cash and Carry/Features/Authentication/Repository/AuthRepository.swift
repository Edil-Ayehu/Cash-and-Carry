//
//  AuthRepository.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

protocol AuthRepository {
    func login(
        phone: String,
        password: String
    ) async throws -> LoginResponse
    
    func register(
        phone: String,
        email: String?,
        name: String,
        password: String,
    ) async throws -> RegisterResponse
    
    func forgotPassword(
        phone: String
    ) async throws -> ForgotPasswordResponse
    
    
    func resetPassword(
        phone: String,
        code: String,
        newPassword: String
    ) async throws -> ResetPasswordResponse
}
