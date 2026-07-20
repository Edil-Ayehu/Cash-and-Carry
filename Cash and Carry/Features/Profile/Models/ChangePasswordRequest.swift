//
//  ChangePasswordRequest.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

struct ChangePasswordRequest: Encodable {
    let oldPassword: String
    let newPassword: String
}
