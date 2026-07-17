//
//  APIClient.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//


import Foundation

final class APIClient {
    
    private let interceptor: RequestInterceptor?
    
    init(interceptor: RequestInterceptor? = nil) {
        self.interceptor = interceptor
    }
    
    func request<T: Decodable>(
        endpoint: String,
        method: String = "GET",
        body: Encodable? = nil
    ) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = body {
            let bodyData = try JSONEncoder().encode(AnyEncodable(body))
            request.httpBody = bodyData
        }
        
        // Mark: Request log
        print("🚀 ================= REQUEST =================")
        print("URL: \(url.absoluteString)")
        print("METHOD: \(method)")
        
        if let headers = request.allHTTPHeaderFields {
            print("HEADERS:")
            headers.forEach { print("   \($0): \($1)") }
        }
        
        if let body = request.httpBody,
           let bodyString = String(data: body, encoding: .utf8) {
            print("BODY:")
            print(bodyString)
        }
        
        print("=============================================")
        
        // Perform request
        
        if let interceptor {
            request = interceptor.intercept(request)
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        // MARK: Response Log
        
        print("📥 ================= RESPONSE ================")
        
        print("STATUS: \(httpResponse.statusCode)")
        
        if let json = String(data: data, encoding: .utf8) {
            print("BODY:")
            print(json)
        }
        
        print("=============================================")
        
        do {
            let decoder = JSONDecoder()
            
            if !(200...299).contains(httpResponse.statusCode) {


                if let apiError = try? decoder.decode(APIErrorResponse.self, from: data) {
                    throw APIError.server(apiError)
                }

                throw APIError.invalidResponse
            }
                        
            
            return try decoder.decode(T.self, from: data)
        } catch {
            
            print("❌ Request Failed:")
            print(error.localizedDescription)
            
            throw error
            
        }
    }
}

struct AnyEncodable: Encodable {

    private let encodeFunc: (Encoder) throws -> Void

    init(_ wrapped: Encodable) {
        encodeFunc = wrapped.encode
    }

    func encode(to encoder: Encoder) throws {
        try encodeFunc(encoder)
    }
}
