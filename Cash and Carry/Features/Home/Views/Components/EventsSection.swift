//
//  EventsSection.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct EventsSection: View {
    
    @StateObject private var eventVM = DIContainer.shared.makeEventViewModel()

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {

                Text("Upcoming Events")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
                
                Button{} label: {
                    Text("See All")
                        .font(.custom("Outfit-Medium", size: 14))
                        .foregroundColor(.cyan)
                }


            }

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 18) {
                    if eventVM.isLoading {
                        ForEach(0..<4) { _ in
                            EventCardSkeleton()
                        }
                    } else {
                        ForEach(eventVM.events) { event in
                            EventCard(event: event)
                        }
                    }

                    

                }
                .padding(.bottom, 4)

            }

        }
        .padding(.horizontal, 20)
        .task {
            await eventVM.fetchEvents()
        }

    }

}
