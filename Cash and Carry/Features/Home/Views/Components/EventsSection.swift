//
//  EventsSection.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct EventsSection: View {

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

                    ForEach(0..<5) { _ in
                        EventCard()
                    }

                }
                .padding(.bottom, 4)

            }

        }
        .padding(.horizontal, 20)

    }

}
