//
//  CountryCodePicker.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct CountryCodePicker: View {

    @Binding var phone: String

    var body: some View {

        HStack(spacing: 12) {

            Text("🇿🇦")

            Text("+27")
                .font(.custom("Outfit-Medium", size: 16))

            Divider()

            TextField("Phone Number", text: $phone)
                .font(.custom("Outfit-Regular", size: 16))
                .keyboardType(.phonePad)

        }
        .padding()
        .frame(height: 58)
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.15))
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
