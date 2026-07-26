//
//  EditProfileViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 26/07/2026.
//

import Foundation

@MainActor
final class EditProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isEdited: Bool = false
    
    private var profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func editProfile(
        name: String,
        email: String?
    ) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            var response = try await profileRepository.editProfile(
                name: name,
                email: email?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true ? nil : email
            )
            
            isEdited = true
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
