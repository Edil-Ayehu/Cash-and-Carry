//
//  AddToFavoriteViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

@MainActor
final class AddToFavoriteViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    @Published var response: AddToFavoriteResponse?
    
    @Published var isSuccess: Bool = false
    
    private var favRepository: FavoriteRepository
    
    init(favRepository: FavoriteRepository) {
        self.favRepository = favRepository
    }
    
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            response = try await favRepository.addToFavorite(request: request)
            
            isSuccess = true
            
        } catch {
            if let apiError = error as? APIError {
                errorMessage = apiError.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
