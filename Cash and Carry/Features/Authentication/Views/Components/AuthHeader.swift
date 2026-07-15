//
//  AuthHeader.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct AuthHeader: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 10) {

            Text(title)
                .font(.custom("Outfit-SemiBold", size: 28))
                .foregroundColor(.black)

            Text(subtitle)
                .font(.custom("Outfit-Regular", size: 16))
                .foregroundColor(.black.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

        }
    }
}

