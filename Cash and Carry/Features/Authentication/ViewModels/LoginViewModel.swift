//
//  LoginViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var isLoggedIn: Bool = false
    
    private var authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func login(
        phone: String,
        password: String
    ) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let _ = try await authRepository.login(phone: "+27\(phone)", password: password)
            
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
