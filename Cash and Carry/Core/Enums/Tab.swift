//
//  Tab.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

enum Tab: String, CaseIterable {

    case home
    case products
    case vouchers
    case cart
    case profile

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .products:
            return "Products"
        case .vouchers:
            return "Vouchers"
        case .cart:
            return "Cart"
        case .profile:
            return "Profile"
        }
    }

    var icon: String {
        switch self {
        case .home:
            return "house"
        case .products:
            return "square.grid.2x2"
        case .vouchers:
            return "ticket.fill"
        case .cart:
            return "cart"
        case .profile:
            return "person"
        }
    }

}
