//
//  EventLocalDataSourceImpl.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

import Foundation

final class EventLocalDataSourceImpl: EventLocalDataSource {
    
    private let key = "cached_events"
    
    func getEvents() -> [EventResponseModel] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let events = try? JSONDecoder().decode([EventResponseModel].self, from: data)
        else {
            return []
        }
        
        return events
    }
    
    func saveEvents(_ events: [EventResponseModel]) {
        guard let data = try? JSONEncoder().encode(events) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func clearEvents() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
