//
//  EventCard.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct EventCard: View {
    
    let event: EventResponseModel

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            
            Image("event1")
                .resizable()
                .scaledToFill()
                .frame(height: 160)
            
            Spacer().frame(height: 6)

            VStack(alignment: .leading, spacing: 10) {

                Text(event.eventType)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.cyan)

                Text(event.title)
                    .font(.custom("Outfit-Medium", size: 16))

                Label(event.startDate, systemImage: "calendar")
                    .font(.custom("Outfit-Regular", size: 14))

                Label("Sep 25, 2026", systemImage: "flag")
                    .font(.custom("Outfit-Regular", size: 14))

            }
            .padding()

        }
        .frame(width: 280)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.05), radius: 8)

    }

}
