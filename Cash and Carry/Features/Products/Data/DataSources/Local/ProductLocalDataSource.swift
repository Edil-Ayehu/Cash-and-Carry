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
}
