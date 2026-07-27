//
//  EventViewModel.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

@MainActor

final class EventViewModel: ObservableObject {
    @Published var events: [EventResponseModel] = []
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var eventRepository: EventRepository
    
    init(eventRepository: EventRepository) {
        self.eventRepository = eventRepository
    }
    
    func fetchEvents() async {
        // Show cached data immediately
        events = eventRepository.getCachedEvents()
        
        
        isLoading = events.isEmpty
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            events = try await eventRepository.fetchEvents()
            
        } catch {
            
            // Only show an error if we have nothing cached
            
            if events.isEmpty {
                errorMessage = error.localizedDescription
            }
            
        }
    }
}
