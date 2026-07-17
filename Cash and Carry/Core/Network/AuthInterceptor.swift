//
//  AuthInterceptor.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

protocol RequestInterceptor {
    func intercept(_ request: URLRequest) -> URLRequest
}

final class AuthInterceptor: RequestInterceptor {
    private let tokenStorage: TokenStorage
    
    
    init(tokenStorage: TokenStorage) {
        self.tokenStorage = tokenStorage
    }
    
    func intercept(_ request: URLRequest) -> URLRequest {
        
        var request = request
        
        if let token = tokenStorage.accessToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}
