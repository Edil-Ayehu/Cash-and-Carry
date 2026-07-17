//
//  OutlinedButton.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct OutlinedButton: View {

    let title: String
    var isLoading: Bool = false
    var isEnabled: Bool = true
    var borderColor: Color = .black
    var textColor: Color = .black
    let action: () -> Void
    var height: CGFloat = 58

    var body: some View {

        Button(action: action) {

            ZStack {

                if isLoading {

                    ProgressView()
                        .tint(borderColor)

                } else {

                    Text(title)
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(
                            isEnabled
                            ? textColor
                            : Color.gray
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(Color.white)
            .overlay(
                Capsule()
                    .stroke(
                        isEnabled
                        ? borderColor
                        : Color.gray.opacity(0.5),
                        lineWidth: 1.5
                    )
            )
        }
        .disabled(isLoading || !isEnabled)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
}
