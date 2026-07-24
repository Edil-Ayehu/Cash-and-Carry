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
            endpoint: APIEndpoints.addToFavorite,
            method: "POST",
            body: request
        )
    }
}
