//
//  FetchFavViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

@MainActor
final class FetchFavViewModel: ObservableObject {
    @Published var favorites: [FavoriteResponse] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorMessage: String?
    
    private var favRepository: FavoriteRepository
    
    init(favRepository: FavoriteRepository) {
        self.favRepository = favRepository
    }
    
    func fetchFavorites() async {
        
        // Show local data immediately
        favorites = favRepository.getCachedFavorites()
        
        
        isLoading = favorites.isEmpty
        
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            favorites = try await favRepository.fetchFavorites()
            
        } catch {
            if favorites.isEmpty {
                errorMessage = error.localizedDescription
            }
        }
    }
}
