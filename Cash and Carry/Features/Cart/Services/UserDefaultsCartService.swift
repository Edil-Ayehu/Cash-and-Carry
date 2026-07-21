//
//  UserDefaultsCartService.swift
//  Cash and Carry
//
//  Created by Edil on 21/07/2026.
//

import Foundation

final class UserDefaultsCartService: CartService {

    private let key = "cart_items"

    func getItems() -> [CartItem] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let items = try? JSONDecoder().decode([CartItem].self, from: data)
        else {
            return []
        }

        return items
    }

    private func save(_ items: [CartItem]) {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }

    func add(_ product: ProductResponse) {

        var items = getItems()

        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(
                CartItem(
                    product: product,
                    quantity: 1
                )
            )
        }

        save(items)
        print("💪 \(product.name) saved")
    }

    func increase(productId: String) {

        var items = getItems()

        guard let index = items.firstIndex(where: { $0.product.id == productId }) else {
            return
        }

        items[index].quantity += 1

        save(items)
    }

    func decrease(productId: String) {

        var items = getItems()

        guard let index = items.firstIndex(where: { $0.product.id == productId }) else {
            return
        }

        if items[index].quantity == 1 {
            items.remove(at: index)
        } else {
            items[index].quantity -= 1
        }

        save(items)
    }

    func remove(productId: String) {

        var items = getItems()

        items.removeAll {
            $0.product.id == productId
        }

        save(items)
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
