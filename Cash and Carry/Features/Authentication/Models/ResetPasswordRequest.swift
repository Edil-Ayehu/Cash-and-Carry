//
//  ResetPasswordRequest.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

struct ResetPasswordRequest: Encodable {
    let phone: String
    let code: String
    let newPassword: String
}
