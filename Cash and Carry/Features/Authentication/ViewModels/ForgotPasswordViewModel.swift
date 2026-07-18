//
//  ForgotPasswordViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

@MainActor
final class ForgotPasswordViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var isOTPSent: Bool = false
    
    @Published var errorMessage: String?
    
    private var authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func forgotPassword(
        phone: String
    ) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let _ = try await authRepository.forgotPassword(phone: "+27\(phone)")
            
            isOTPSent = true
        }catch {
            errorMessage = error.localizedDescription
        }
    }
}
