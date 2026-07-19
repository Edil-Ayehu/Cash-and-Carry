//
//  EventRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class EventRepositoryImpl: EventRepository {
    private var eventService: EventService
    
    init(eventService: EventService) {
        self.eventService = eventService
    }
    
    func fetchEvents() async throws -> [EventResponseModel] {
        try await eventService.fetchEvents()
    }
}
