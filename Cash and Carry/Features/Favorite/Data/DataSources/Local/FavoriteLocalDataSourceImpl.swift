//
//  FavoriteLocalDataSourceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 28/07/2026.
//

import Foundation

final class FavoriteLocalDataSourceImpl: FavoriteLocalDataSource {
    
    private let key = "cached_favorites"
    
    func getFavorites() -> [FavoriteResponse] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let favorites = try? JSONDecoder().decode([FavoriteResponse].self, from:data)
        else {
            return []
        }
        
        return favorites
    }
    
    func saveFavorites(_ favorites: [FavoriteResponse]) {
        guard let data = try? JSONEncoder().encode(favorites) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func clearFavorites() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
