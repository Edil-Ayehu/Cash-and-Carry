//
//  PrimaryButton.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct PrimaryButton: View {

    let title: String
    var isLoading: Bool = false
    var isEnabled: Bool = true
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            ZStack {

                if isLoading {

                    ProgressView()
                        .tint(.white)

                } else {

                    Text(title)
                        .font(.custom("Outfit-SemiBold", size: 16))
                        .foregroundStyle(.white)

                }

            }
            .frame(maxWidth: .infinity)
            .frame(height: 58)
            .background(
                isEnabled ? Color.black : Color.gray.opacity(0.5)
            )
            .clipShape(Capsule())

        }
        .disabled(isLoading || !isEnabled)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
}
