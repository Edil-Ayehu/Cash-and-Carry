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
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            events = try await eventRepository.fetchEvents()
            
        } catch {
            
            if let apiError = error as? APIError {
                            errorMessage = apiError.localizedDescription
                        } else {
                            errorMessage = error.localizedDescription
                        }
        }
    }
}
