//
//  EventDetailsBottomSheet.swift
//  Cash and Carry
//
//  Created by Edil on 23/07/2026.
//

import SwiftUI

struct EventDetailsBottomSheet: View {
    
    let event: EventResponseModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 24) {
            
            Spacer().frame(height: 8)
            
            // Header
            HStack(spacing: 18) {
                
                eventImage
                
                Text(event.title)
                    .font(.custom("Outfit-SemiBold", size: 18))
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    detailRow(
                        icon: "play.circle",
                        title: "Start",
                        value: event.startDate.formattedDateTime()
                    )
                    
                    detailRow(
                        icon: "flag",
                        title: "End",
                        value: event.endDate.formattedDateTime()
                    )
                    
                    detailRow(
                        icon: "tag",
                        title: "Type",
                        value: event.eventType
                    )
                    
                    detailRow(
                        icon: "doc.text",
                        title: "Description",
                        value: event.description
                    )
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .padding(.bottom, 24)
    }
}

private extension EventDetailsBottomSheet {
    
    @ViewBuilder
    var eventImage: some View {
        
        if let url = URL(string: event.bannerImage),
           !event.bannerImage.isEmpty {
            
            AsyncImage(url: url) { phase in
                
                switch phase {
                    
                case .empty:
                    ProgressView()
                        .frame(width: 74, height: 74)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                case .failure(_):
                    placeholder
                    
                @unknown default:
                    placeholder
                }
            }
            
        } else {
            placeholder
        }
    }
    
    var placeholder: some View {
        
        Image(systemName: "photo")
            .font(.system(size: 28))
            .foregroundColor(.gray)
            .frame(width: 74, height: 74)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func detailRow(
        icon: String,
        title: String,
        value: String
    ) -> some View {
        
        HStack(alignment: .top, spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 18))
                .frame(width: 44, height: 44)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text(title)
                    .font(.custom("Outfit-Regular", size: 12))
                    .foregroundColor(.gray)
                
                Text(value)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.black.opacity(0.8))
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
    }
}
