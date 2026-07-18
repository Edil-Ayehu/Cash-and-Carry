//
//  RegisterViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

@MainActor
final class RegisterViewModel: ObservableObject {
    @Published var isRegistered: Bool = false
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    private var authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func register(
        name: String,
        phone: String,
        email: String?,
        password: String,
    ) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let _ = try await authRepository.register(
                phone: "+27\(phone)",
                email: email?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true
                        ? nil
                        : email?.trimmingCharacters(in: .whitespacesAndNewlines),
                name: name,
                password: password
            )
            
            isRegistered = true
        } catch {
            if let apiError = error as? APIError {
            errorMessage = apiError.localizedDescription
              } else {
                   errorMessage = error.localizedDescription
               }
        }
    }
}
