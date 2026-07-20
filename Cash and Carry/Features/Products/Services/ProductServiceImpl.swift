//
//  ProductServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class ProductServiceImpl: ProductService {
    private var apiClient: APIClient
    
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchProducts(
        category: String?
    ) async throws -> [ProductResponse] {
        
        var endpoint = "\(APIEndpoints.products)?catalog=false"
        
        if let category,
            !category.isEmpty {
            endpoint += "&category=\(category)"
        }
        
        return try await apiClient.request(
            endpoint: endpoint,
        )
    }
    
    func fetchCategories() async throws -> [CategoryResponse] {
        try await apiClient.request(
            endpoint: APIEndpoints.categories
        )
    }
}
