//
//  APIErrorResponse.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

struct APIErrorResponse: Decodable {
    let statusCode: Int
    let message: [String]
    let error: String
}
