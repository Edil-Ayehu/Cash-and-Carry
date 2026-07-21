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
    
    @Published var loadingProductId: String?
    
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

    func add(product: ProductResponse) async {
        loadingProductId = product.id
        
        defer {
            loadingProductId = nil
        }
        
        try? await Task.sleep(for: .seconds(2))

            service.add(product)
            loadCart()

            productAdded = true
        
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
    
    func contains(productId: String) -> Bool {
        service.contains(productId: productId)
    }
}
