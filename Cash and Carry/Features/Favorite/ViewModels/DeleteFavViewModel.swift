//
//  DeleteFavViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 25/07/2026.
//

import Foundation

@MainActor
final class DeleteFavViewModel: ObservableObject {
    @Published var isDeleted: Bool = false
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var successMessage: String?
    
    private var favRepository: FavoriteRepository
    
    init(favRepository: FavoriteRepository) {
        self.favRepository = favRepository
    }
    
    func deleteFavorite(
        id: String
    ) async {
        isLoading = true
        errorMessage = nil
        successMessage = nil
        
        defer {
            isLoading = false
        }
        
        do{
            let response = try await favRepository.deleteFavorite(id: id)
            
            isDeleted = true
            successMessage = response.message
            
        }catch {
            if let apiError = error as? APIError {
                errorMessage = apiError.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
        }
    }
}
