//
//  ResetPasswordViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var passwordReseted: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var successMessage: String?
    
    private var authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func resetPassword(
        phone: String,
        code: String,
        newPassword: String
    ) async {
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await authRepository.resetPassword(
                phone: "+27\(phone)",
                code: code,
                newPassword: newPassword
            )
            
            successMessage = response.message
            passwordReseted = true
            
        } catch {
            if let apiError = error as? APIError {
                     errorMessage = apiError.localizedDescription
              } else {
                    errorMessage = error.localizedDescription
            }
        }
    }
}
