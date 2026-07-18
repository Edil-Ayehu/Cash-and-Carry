//
//  ResetPasswordResponse.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

struct ResetPasswordResponse: Decodable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
