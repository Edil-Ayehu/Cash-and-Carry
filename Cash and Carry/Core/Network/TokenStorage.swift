//
//  TokenStorage.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation
import Security

protocol TokenStorage {
    var accessToken: String? { get }
    func save(token: String)
    func clear()
}

final class KeychainTokenStorage: TokenStorage {

    private let service = Bundle.main.bundleIdentifier ?? "CashAndCarry"
    private let account = "access_token"

    var accessToken: String? {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var result: AnyObject?

        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard
            status == errSecSuccess,
            let data = result as? Data,
            let token = String(data: data, encoding: .utf8)
        else {
            return nil
        }

        return token
    }

    func save(token: String) {

        guard let data = token.data(using: .utf8) else { return }

        // Remove old token if it exists
        clear()

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        if status == errSecSuccess {
            print("🙌🙌🙌 Access token saved to Keychain!")
        } else {
            print("❌ Failed to save token. Status: \(status)")
        }
    }

    func clear() {

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]

        let status = SecItemDelete(query as CFDictionary)

        if status == errSecSuccess || status == errSecItemNotFound {
            print("🙌🙌🙌 Access token removed from Keychain!")
        } else {
            print("❌ Failed to remove token. Status: \(status)")
        }
    }
}
