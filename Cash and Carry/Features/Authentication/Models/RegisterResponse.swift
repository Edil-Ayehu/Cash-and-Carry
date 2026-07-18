//
//  RegisterResponse.swift
//  Cash and Carry
//
//  Created by Edil on 18/07/2026.
//

import Foundation

struct RegisterResponse: Decodable {

    let phone: String
    let email: String?
    let name: String

    enum CodingKeys: String, CodingKey {

        case phone
        case email
        case name
    }
}
