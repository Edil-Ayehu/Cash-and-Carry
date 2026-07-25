//
//  FavoriteServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

final class FavoriteServiceImpl: FavoriteService {
    private var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async throws -> AddToFavoriteResponse {
        try await apiClient.request(
            endpoint: APIEndpoints.favorites,
            method: "POST",
            body: request
        )
    }
    
    func fetchFavorites() async throws -> [FavoriteResponse] {
        try await apiClient.request(
            endpoint: APIEndpoints.favorites
        )
    }
    
    func deleteFavorite(
        id: String
    ) async throws -> DeleteFavResponse {
        var endpoint = APIEndpoints.favorites + "/\(id)"
        
        return try await apiClient.request(
            endpoint: endpoint,
            method: "DELETE"
        )
        
        
    }
}
