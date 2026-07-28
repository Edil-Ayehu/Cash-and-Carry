//
//  FavoriteRepository.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

protocol FavoriteRepository {
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async throws -> AddToFavoriteResponse
    
    func fetchFavorites() async throws -> [FavoriteResponse]
    
    func getCachedFavorites() -> [FavoriteResponse]
    
    func deleteFavorite(
        id: String
    ) async throws -> DeleteFavResponse
}
