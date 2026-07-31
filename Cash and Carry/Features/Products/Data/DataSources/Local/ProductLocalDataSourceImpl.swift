//
//  ProductLocalDataSourceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 31/07/2026.
//

import Foundation

final class ProductLocalDataSourceImpl: ProductLocalDataSource {
    
    private var key = "cached-products"
    
    func getProducts() -> [ProductResponse] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let products = try? JSONDecoder().decode([ProductResponse].self, from: data)
        else {
            return []
        }
        
        return products
    }
    
    func saveProducts(_ products: [ProductResponse]) {
        guard let data = try? JSONEncoder().encode(products) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func clearProducts() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
