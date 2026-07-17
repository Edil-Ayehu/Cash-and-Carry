//
//  LoginRequest.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//
import Foundation

struct LoginRequest: Encodable {
    let phone: String
    let password: String
}
