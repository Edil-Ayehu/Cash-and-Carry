//
//  LogoutViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

@MainActor
final class LogoutViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    
    @Published var isLoggedOut: Bool = false
    
    private var authRepository: AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
    
    func logout() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.isLoggedOut = true
            
            self.authRepository.logout()
        }
    }
}
