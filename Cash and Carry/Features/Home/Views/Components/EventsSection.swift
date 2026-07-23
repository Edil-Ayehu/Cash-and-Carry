//
//  EventsSection.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct EventsSection: View {
    
    @StateObject private var eventVM = DIContainer.shared.makeEventViewModel()
    
    @State private var selectedEvent: EventResponseModel?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                
                Text("Upcoming Events")
                    .font(.custom("Outfit-Medium", size: 16))
                
                Spacer()
                            
                
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
                                .onTapGesture {
                                    selectedEvent = event
                                }
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
        .sheet(item: $selectedEvent) { event in
            EventDetailsBottomSheet(event: event)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(24)
            
        }
        
    }
    
}
