//
//  ProductRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    private var productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
    }
    
    func fetchProducts(
        category: String?
    ) async throws -> [ProductResponse] {
        try await productService.fetchProducts(
            category: category
        )
    }
    
    func fetchCategories() async throws -> [CategoryResponse] {
        try await productService.fetchCategories()
    }
}
