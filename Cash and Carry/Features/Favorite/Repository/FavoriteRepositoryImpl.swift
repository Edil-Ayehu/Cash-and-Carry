//
//  FavoriteRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

final class FavoriteRepositoryImpl: FavoriteRepository {
    
    private var favService: FavoriteService
    private var favLocalDataSource: FavoriteLocalDataSource
    
    init(
        favService: FavoriteService,
        favLocalDataSource: FavoriteLocalDataSource
    ) {
        self.favService = favService
        self.favLocalDataSource = favLocalDataSource
    }
    
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async throws -> AddToFavoriteResponse {
        try await favService.addToFavorite(
            request: request
        )
    }
    
    func fetchFavorites() async throws -> [FavoriteResponse] {
        let favorites = try await favService.fetchFavorites()
        favLocalDataSource.saveFavorites(favorites)
        
        return favorites
    }
    
    func getCachedFavorites() -> [FavoriteResponse] {
        favLocalDataSource.getFavorites()
    }
    
    func deleteFavorite(
        id: String
    ) async throws -> DeleteFavResponse {
        try await favService.deleteFavorite(id: id)
    }
    
}
