//
//  EventRepositoryImpl.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

final class EventRepositoryImpl: EventRepository {
    
    private var eventService: EventService
    private var eventLocalDataSource: EventLocalDataSource
    
    
    init(
        eventService: EventService,
        eventLocalDataSource: EventLocalDataSource
    ) {
        self.eventService = eventService
        self.eventLocalDataSource = eventLocalDataSource
    }
    
    func fetchEvents() async throws -> [EventResponseModel] {
        let events = try await eventService.fetchEvents()
        
        eventLocalDataSource.saveEvents(events)
        
        return events
    }
    
    func getCachedEvents() -> [EventResponseModel] {
        eventLocalDataSource.getEvents()
    }
    
}
