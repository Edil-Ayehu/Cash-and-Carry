//
//  AppSecureField.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct AppSecureField: View {

    let title: String

    @Binding var text: String

    @State private var isSecure = true

    var body: some View {

        HStack {

            Image(systemName: "lock")
                .foregroundStyle(.gray)
                .frame(width: 20)

            if isSecure {

                SecureField(title, text: $text)
                    .font(.custom("Outfit-Regular", size: 16))

            } else {

                TextField(title, text: $text)
                    .font(.custom("Outfit-Regular", size: 16))

            }

            Button {

                isSecure.toggle()

            } label: {

                Image(systemName: isSecure ? "eye" : "eye.slash")
                    .foregroundStyle(.gray)

            }

        }
        .padding()
        .frame(height: 58)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.15))
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
