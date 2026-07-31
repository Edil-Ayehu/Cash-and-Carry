//
//  ProductLocalDataSource.swift
//  Cash and Carry
//
//  Created by Edil on 31/07/2026.
//

protocol ProductLocalDataSource {
    func getProducts() -> [ProductResponse]
    func saveProducts(_ product: [ProductResponse])
    func clearProducts()
    
    func getCategories() -> [CategoryResponse]
    func saveCategories(_ categories: [CategoryResponse])
    func clearCategories()
}
