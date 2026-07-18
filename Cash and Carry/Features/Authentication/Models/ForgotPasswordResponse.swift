//
//  ForgotPasswordResponse.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

struct ForgotPasswordResponse: Decodable {
    let message: String
    let developmentOtpCode: String?
    
    enum CodingKeys: String, CodingKey {
        case message
        case developmentOtpCode
    }
}
