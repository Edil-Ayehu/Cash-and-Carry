//
//  AuthRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    private let authService: AuthService
    private let tokenStorage: TokenStorage
    
    init(authService: AuthService, tokenStorage: TokenStorage) {
        self.authService = authService
        self.tokenStorage = tokenStorage
    }
    
    func login(
        phone: String,
        password: String
    ) async throws -> LoginResponse {
        
        let request = LoginRequest(
            phone: phone,
            password: password
        )
        
        let response = try await authService.login(request: request)
        
        // MARK: Store/Save auth token
        tokenStorage.save(token: response.accessToken)
        
        return response
    }
    
    func register(
        phone: String,
        email: String?,
        name: String,
        password: String,
    ) async throws -> RegisterResponse {
        
        let request = RegisterRequest(
            name: name,
            phone: phone,
            email: email,
            password: password
        )
        
        let response = try await authService.register(request: request)
        
        return response
    }
    
    func forgotPassword(
        phone: String
    ) async throws -> ForgotPasswordResponse {
        let request = ForgotPasswordRequest(
            phone: phone
        )
        
        let response = try await authService.forgotPassword(request: request)
        
        return response
    }
    
    func resetPassword(
        phone: String,
        code: String,
        newPassword: String
    ) async throws -> ResetPasswordResponse {
        let request = ResetPasswordRequest(
            phone: phone,
            code: code,
            newPassword: newPassword
        )
        
        let response = try await authService.resetPassword(request: request)
        
        return response
    }
    
    func logout() {
        tokenStorage.clear()
    }
}
