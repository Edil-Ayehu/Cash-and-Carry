//
//  FavoriteRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

final class FavoriteRepositoryImpl: FavoriteRepository {
    
    private var favService: FavoriteService
    
    init(favService: FavoriteService) {
        self.favService = favService
    }
    
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async throws -> AddToFavoriteResponse {
        try await favService.addToFavorite(
            request: request
        )
    }
    
    func fetchFavorites() async throws -> [FavoriteResponse] {
        try await favService.fetchFavorites()
    }
    
    func deleteFavorite(
        id: String
    ) async throws -> DeleteFavResponse {
        try await favService.deleteFavorite(id: id)
    }
}
