//
//  ProductRepository.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

protocol ProductRepository {
    
    func fetchProducts(
        category: String?
    ) async throws -> [ProductResponse]
    
    func fetchCategories() async throws -> [CategoryResponse]
}
