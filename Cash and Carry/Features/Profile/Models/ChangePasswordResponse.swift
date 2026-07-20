//
//  ChangePasswordResponse.swift
//  Cash and Carry
//
//  Created by Edil on 20/07/2026.
//

import Foundation

struct ChangePasswordResponse: Decodable {
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
