//
//  CartService.swift
//  Cash and Carry
//
//  Created by Edil on 21/07/2026.
//

import Foundation

protocol CartService {
    func getItems() -> [CartItem]
    func add(_ product: ProductResponse)
    func increase(productId: String)
    func decrease(productId: String)
    func remove(productId: String)
    func clear()
    
    func contains(productId: String) -> Bool
}
