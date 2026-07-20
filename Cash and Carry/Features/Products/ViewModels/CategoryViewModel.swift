//
//  CategoryViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

@MainActor
final class CategoryViewModel: ObservableObject {
    @Published var categories: [CategoryResponse] = []
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func fetchCategories() async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            categories = try await productRepository.fetchCategories()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
