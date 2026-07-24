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
}
