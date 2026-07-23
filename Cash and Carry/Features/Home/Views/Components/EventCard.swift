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
            
            
            eventImage
            
            Spacer().frame(height: 6)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(event.eventType)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.cyan)
                
                Text(event.title)
                    .font(.custom("Outfit-Medium", size: 16))
                
                Label(event.startDate.formattedDateTime(), systemImage: "calendar")
                    .font(.custom("Outfit-Regular", size: 14))
                
                Label(event.endDate.formattedDateTime(), systemImage: "flag")
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

private extension EventCard {
    
    @ViewBuilder
    var eventImage: some View {
        if let url = URL(string: event.bannerImage),
           !event.bannerImage.isEmpty {
            
            AsyncImage(url: url) { phase in
                
                switch phase {
                    
                case .empty:
                    imageSkeleton
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 160)
                        .clipped()
                    
                case .failure(_):
                    placeholderImage
                    
                @unknown default:
                    placeholderImage
                }
            }
            
        } else {
            placeholderImage
        }
    }
    
    var imageSkeleton: some View {
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.gray.opacity(0.18))
                .frame(maxWidth: .infinity)
                .frame(height: 160)
        }
    
    var placeholderImage: some View {
        
        Image(systemName: "photo")
            .font(.system(size: 40))
            .foregroundColor(.gray.opacity(0.6))
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(Color.gray.opacity(0.08))
    }
}
