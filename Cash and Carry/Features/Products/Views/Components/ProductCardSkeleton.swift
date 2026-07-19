//
//  ProductCardSkeleton.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import SwiftUI

struct ProductCardSkeleton: View {

    @State private var isAnimating = false

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            skeleton
                .frame(height: 140)

            VStack(alignment: .leading, spacing: 10) {

                skeleton
                    .frame(width: 70, height: 14)

                skeleton
                    .frame(height: 18)

                skeleton
                    .frame(width: 100, height: 18)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.04), radius: 8)
    }

    private var skeleton: some View {
        RoundedRectangle(cornerRadius: 8)
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
            .clipped()
            .onAppear {
                withAnimation(
                    .linear(duration: 1.1)
                    .repeatForever(autoreverses: false)
                ) {
                    isAnimating = true
                }
            }
    }
}
