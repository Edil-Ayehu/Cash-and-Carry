//
//  RegisterRequest.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//
import Foundation

struct RegisterRequest: Encodable {
    let name: String
    let phone: String
    let email: String?
    let password: String
}
