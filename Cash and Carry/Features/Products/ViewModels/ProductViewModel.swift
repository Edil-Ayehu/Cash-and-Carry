//
//  ProductViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

@MainActor
final class ProductViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var isRefreshing: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var products: [ProductResponse] = []
    
    private var productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func fetchProducts(
        category: String?,
        search: String?,
        refresh: Bool = false
    ) async {
        if refresh {
            isRefreshing = true
        } else {
            isLoading = true
        }
       isLoading = true
        
        defer{
            isLoading = false
            isRefreshing = false
        }
        
        do {
            let products = try await productRepository.fetchProducts(
                category: category,
                search: search
            )
            
            self.products = products
            
        } catch {
            if let apiError = error as? APIError {
                   errorMessage = apiError.localizedDescription
             } else {
                    errorMessage = error.localizedDescription
            }
        }
    }
}
