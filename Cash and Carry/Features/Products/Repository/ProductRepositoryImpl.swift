//
//  ProductRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class ProductRepositoryImpl: ProductRepository {
    private var productService: ProductService
    private var productLocalDataSource: ProductLocalDataSource
    
    init(
        productService: ProductService,
        productLocalDataSource: ProductLocalDataSource
    ) {
        self.productService = productService
        self.productLocalDataSource = productLocalDataSource
    }
    
    func fetchProducts(
        category: String?,
        search: String?
    ) async throws -> [ProductResponse] {
        let products = try await productService.fetchProducts(
            category: category,
            search: search
        )
        
        productLocalDataSource.saveProducts(products)
        
        return products
    }
    
    func getCachedProducts() -> [ProductResponse] {
        productLocalDataSource.getProducts()
    }
    
    func fetchCategories() async throws -> [CategoryResponse] {
        try await productService.fetchCategories()
    }
}
