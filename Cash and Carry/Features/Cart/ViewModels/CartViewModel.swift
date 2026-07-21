//
//  CartViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 21/07/2026.
//

import Foundation

@MainActor
final class CartViewModel: ObservableObject {

    @Published var items: [CartItem] = []
    
    @Published var isLoading: Bool = false
    
    @Published var productAdded: Bool = false
    
    @Published var errorMessage: String?

    private let service: CartService

    init(service: CartService) {
        self.service = service
        loadCart()
    }

    func loadCart() {
        items = service.getItems()
    }

    func add(product: ProductResponse) {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: .init {
                self.service.add(product)
                self.loadCart()
            })
            
            productAdded = true
            
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }

    func increase(_ item: CartItem) {
        service.increase(productId: item.product.id)
        loadCart()
    }

    func decrease(_ item: CartItem) {
        service.decrease(productId: item.product.id)
        loadCart()
    }

    func remove(_ item: CartItem) {
        service.remove(productId: item.product.id)
        loadCart()
    }

    func clearCart() {
        service.clear()
        loadCart()
    }
}
