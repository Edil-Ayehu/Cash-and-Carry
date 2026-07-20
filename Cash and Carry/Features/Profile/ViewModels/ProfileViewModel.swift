//
//  ProfileViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var profile: ProfileResponse?
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var profileRepository: ProfileRepository
    
    init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
    
    func getProfile() async {
        isLoading = true
        
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            profile = try await profileRepository.getProfile()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
