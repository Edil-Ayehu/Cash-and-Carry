//
//  AppTextfield.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct AppTextField: View {

    let title: String
    let systemImage: String

    @Binding var text: String

    var keyboard: UIKeyboardType = .default

    var body: some View {

        HStack(spacing: 14) {

            Image(systemName: systemImage)
                .foregroundStyle(.gray)
                .frame(width: 20)

            TextField(title, text: $text)
                .font(.custom("Outfit-Regular", size: 16))
                .keyboardType(keyboard)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)

        }
        .padding()
        .frame(height: 58)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
