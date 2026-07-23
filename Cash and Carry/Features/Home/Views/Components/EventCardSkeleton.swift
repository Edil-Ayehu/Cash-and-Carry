//
//  EventCardSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import SwiftUI

struct EventCardSkeleton: View {
    
    @State private var isAnimating = false

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            RoundedRectangle(cornerRadius: 0)
                .fill(Color.gray.opacity(0.18))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.clear,
                                    Color.white.opacity(0.6),
                                    Color.clear
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .offset(x: isAnimating ? 250 : -250)
                )
                .frame(height: 160)
                .onAppear {
                    withAnimation(
                        .linear(duration: 1.1)
                        .repeatForever(autoreverses: false)
                    ) {
                        isAnimating = true
                    }
                }

            Spacer()
                .frame(height: 6)

            VStack(alignment: .leading, spacing: 12) {

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 90, height: 14)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 18)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 150, height: 14)

                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 130, height: 14)

            }
            .padding()

        }
        .frame(width: 280)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.05), radius: 8)
        .redacted(reason: .placeholder)
    }
}
