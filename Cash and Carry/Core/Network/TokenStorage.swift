//
//  TokenStorage.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

protocol TokenStorage {
    var accessToken: String? { get }
    func save(token: String)
    func clear()
}

final class UserDefaultsTokenStorage: TokenStorage {
    private let key = "access_token"
    
    var accessToken: String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    func save(token: String) {
        print("🙌🙌🙌 Access token saved successfully!")
        print("📝 The token: \(token)")
        UserDefaults.standard.set(token, forKey: key)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
        print("🙌🙌🙌 Access token cleared successfully!")
    }
}
