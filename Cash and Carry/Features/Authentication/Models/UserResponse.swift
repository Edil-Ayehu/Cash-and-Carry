//
//  UserResponse.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//
import Foundation

struct UserResponse: Decodable {
    let id: String
    let phone: String
    let name: String
    let email: String?
}
