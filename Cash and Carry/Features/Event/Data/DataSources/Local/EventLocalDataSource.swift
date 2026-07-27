//
//  EventLocalDataSource.swift
//  Cash and Carry
//
//  Created by Edil on 27/07/2026.
//

protocol EventLocalDataSource {
    func getEvents() -> [EventResponseModel]
    func saveEvents(_ events: [EventResponseModel])
    func clearEvents()
}
