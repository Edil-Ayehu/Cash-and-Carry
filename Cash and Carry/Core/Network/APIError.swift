//
//  APIError.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//


import Foundation

enum APIError: LocalizedError {
    case server(APIErrorResponse)
    case invalidResponse

    var errorDescription: String? {
        switch self {
        case .server(let response):
            return response.message.first ?? response.error
        case .invalidResponse:
            return "Invalid server response."
        }
    }
}
