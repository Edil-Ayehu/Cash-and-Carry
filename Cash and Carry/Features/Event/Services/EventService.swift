//
//  EventService.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

protocol EventService {
    func fetchEvents() async throws -> [EventResponseModel]
}
