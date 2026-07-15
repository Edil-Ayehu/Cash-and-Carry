//
//  AppRouter.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

@MainActor
final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    @Published var root: AppRoute = .login
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func setRoot(_ route: AppRoute) {
        path = NavigationPath()
        root = route
    }
    
    func replace(with route: AppRoute) {
        path = NavigationPath()
        path.append(route)
    }
}
