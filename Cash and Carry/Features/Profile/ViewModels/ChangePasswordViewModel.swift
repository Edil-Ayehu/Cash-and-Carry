//
//  ChangePasswordViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

@MainActor
final class ChangePasswordViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var successMessage: String?
    
    @Published var passwordChanged: Bool = false
    
    private var profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func changePassword(
        oldPassword: String,
        newPassword: String
    ) async {
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response = try await profileRepository.changePassword(
                oldPassword: oldPassword,
                newPassword: newPassword
            )
            
            successMessage = response.message
            passwordChanged = true
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
