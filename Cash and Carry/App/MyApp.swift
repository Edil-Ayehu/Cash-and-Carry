//
//  MyApp.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct MyApp: View {
    @StateObject private var router = AppRouter()
        
    var body: some View {
        NavigationStack(path: $router.path) {
            rootView
                .navigationDestination(for: AppRoute.self) {route in
                    switch route {
                        
                    case .login:
                        LoginView()
                        
                    case .register:
                        RegisterView()
                        
                    case .forgotPassword:
                        ForgotPasswordView()
                        
                    case .resetPassword:
                        ResetPasswordView()
                        
                    }
                }
        }
        .environmentObject(router)
    }
    
    @ViewBuilder
    private var rootView: some View {
        switch router.root {
        case .login:
            LoginView()
            
            
        case .register:
            RegisterView()
            
        case .forgotPassword:
            ForgotPasswordView()
            
        case .resetPassword:
            ResetPasswordView()
            
        }
    }
}

