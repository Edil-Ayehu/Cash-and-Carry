//
//  ProfileResponse.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

struct ProfileResponse: Decodable {
    let phone: String
    let email: String?
    let name: String
    let isActive: Bool
    let createdAt: String
}
