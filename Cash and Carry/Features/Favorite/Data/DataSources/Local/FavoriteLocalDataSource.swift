//
//  FavoriteLocalDataSource.swift
//  Cash and Carry
//
//  Created by Edil on 28/07/2026.
//

protocol FavoriteLocalDataSource {
    func getFavorites() -> [FavoriteResponse]
    func saveFavorites(_ favorites: [FavoriteResponse])
    func clearFavorites()
}
