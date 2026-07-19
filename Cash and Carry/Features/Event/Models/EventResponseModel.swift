//
//  EventResponseModel.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import Foundation

struct EventResponseModel: Decodable, Identifiable, Hashable {
    let id: String
    let title: String
    let description: String
    let bannerImage: String
    let startDate: String
    let endDate: String
    let eventType: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case bannerImage
        case startDate
        case endDate
        case eventType
        case address
    }
}
