//
//  LoginResponse.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import Foundation

struct LoginResponse: Decodable {
    let accessToken: String
    let user: UserResponse
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case user
    }
}
