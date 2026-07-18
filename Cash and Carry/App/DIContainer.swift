//
//  DIContainer.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//


import Foundation

@MainActor
final class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    lazy var tokenStorage: TokenStorage = {
        KeychainTokenStorage()
    } ()
    
    lazy var authInterceptor: AuthInterceptor = {
        AuthInterceptor(tokenStorage: tokenStorage)
    } ()
    
    // Repositories
    
    lazy var authRepository: AuthRepository = {
        AuthRepositoryImpl(
            authService: authService,
            tokenStorage: tokenStorage
        )
    } ()
    
    // MARK: Services
    
    lazy var apiClient: APIClient = {
        APIClient(interceptor: authInterceptor)
    } ()
    
    lazy var authService: AuthService = {
        AuthServiceImpl(apiClient: apiClient)
    } ()
    
    
    // MARK: ViewModels
    
    func makeLoginViewModel() -> LoginViewModel {
        LoginViewModel(authRepository: authRepository)
    }
    
    func makeRegisterViewModel() -> RegisterViewModel {
        RegisterViewModel(authRepository: authRepository)
    }
    
    func makeForgotPasswordViewModel() -> ForgotPasswordViewModel {
        ForgotPasswordViewModel(authRepository: authRepository)
    }
    
    func makeResetPasswordViewModel() -> ResetPasswordViewModel {
        ResetPasswordViewModel(authRepository: authRepository)
    }
    
    func makeLogoutViewModel() -> LogoutViewModel {
        LogoutViewModel(authRepository: authRepository)
    }
}
