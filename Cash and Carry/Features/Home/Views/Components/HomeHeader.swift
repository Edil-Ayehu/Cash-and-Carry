//
//  HomeHeader.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct HomeHeader: View {

    var body: some View {

        ZStack {
            
            // White background
            Color.white
                .edgesIgnoringSafeArea(.all)


            VStack(spacing: 28) {

                HStack {

                    VStack(alignment: .leading, spacing: 6) {

                        Text("Good Morning 👋")
                            .font(.custom("Outfit-Regular", size: 16))
                            .foregroundColor(.black.opacity(0.9))

                        Text("What are we\nordering today?")
                            .font(.custom("Outfit-Medium", size: 20))
                            .foregroundColor(.black)

                    }

                    Spacer()

                    HStack(spacing: 14) {

                        HeaderIcon(systemImage: "heart")

                        HeaderIcon(systemImage: "bell")

                    }

                }

            }
            .padding(.horizontal, 24)
            .padding(.top, 65)
            .padding(.bottom, 35)

        }
        .clipShape(
            UnevenRoundedRectangle(
                bottomLeadingRadius: 35,
                bottomTrailingRadius: 35
            )
        )
    }
}
