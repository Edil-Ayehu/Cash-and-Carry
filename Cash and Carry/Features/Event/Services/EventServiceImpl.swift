//
//  EventServiceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class EventServiceImpl: EventService {
    private var apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchEvents() async throws -> [EventResponseModel] {
        try await apiClient.request(endpoint: APIEndpoints.events)
    }
}
