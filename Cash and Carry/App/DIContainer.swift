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
    
    lazy var productRepository: ProductRepository = {
        ProductRepositoryImpl(productService: productService)
    } ()
    
    lazy var eventRepository: EventRepository = {
        EventRepositoryImpl(eventService: eventService)
    } ()
    
    lazy var myVoucherRepository: MyVoucherRepository = {
        MyVoucherRepositoryImpl(myVoucherService: myVoucherService)
    } ()
    
    lazy var profileRepository: ProfileRepository = {
        ProfileRepositoryImpl(profileService: profileService)
    } ()
    
    lazy var voucherRepository: VoucherRepository = {
        VoucherRepositoryImpl(voucherService: voucherService)
    } ()
    
    // MARK: Services
    
    lazy var apiClient: APIClient = {
        APIClient(interceptor: authInterceptor)
    } ()
    
    lazy var authService: AuthService = {
        AuthServiceImpl(apiClient: apiClient)
    } ()
    
    lazy var productService: ProductService = {
        ProductServiceImpl(apiClient: apiClient)
    } ()
    
    lazy var eventService: EventService = {
        EventServiceImpl(apiClient: apiClient)
    } ()
    
    lazy var myVoucherService: MyVoucherService = {
        MyVoucherServiceImpl(apiClient: apiClient)
    } ()
    
    lazy var profileService: ProfileService = {
        ProfileServiceImpl(apiClient: apiClient)
    } ()
    
    lazy var cartService: CartService = {
        UserDefaultsCartService()
    } ()
    
    lazy var voucherService: VoucherService = {
        VoucherServiceImpl(apiClient: apiClient)
    } ()
    
//    private lazy var cartService: CartService = UserDefaultsCartService()
    
    
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
    
    func makeProductViewModel() -> ProductViewModel {
        ProductViewModel(productRepository: productRepository)
    }
    
    func makeEventViewModel() -> EventViewModel {
        EventViewModel(eventRepository: eventRepository)
    }
    
    func makeMyVoucherViewModel() -> MyVoucherViewModel {
        MyVoucherViewModel(myVoucherRepository: myVoucherRepository)
    }
    
    func makeCategoryViewModel() -> CategoryViewModel {
        CategoryViewModel(productRepository: productRepository)
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(profileRepository: profileRepository)
    }
    
    func makeChangePasswordViewModel() -> ChangePasswordViewModel {
        ChangePasswordViewModel(profileRepository: profileRepository)
    }
    
    func makeCartViewModel() -> CartViewModel {
        CartViewModel(service: cartService)
    }
    
    func makeGenerateVoucherViewModel() -> GenerateVoucherViewModel {
        GenerateVoucherViewModel(voucherRepository: voucherRepository)
    }
}
