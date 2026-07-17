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
}
