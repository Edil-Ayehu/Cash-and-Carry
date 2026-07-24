//
//  FavoriteService.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import Foundation

protocol FavoriteService {
    func addToFavorite(
        request: AddToFavoriteRequest
    ) async throws -> AddToFavoriteResponse
}
