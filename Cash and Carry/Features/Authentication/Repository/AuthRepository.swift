//
//  AuthRepository.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

protocol AuthRepository {
    func login(
        phone: String,
        password: String
    ) async throws -> LoginResponse
}
