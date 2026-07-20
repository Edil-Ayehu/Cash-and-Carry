//
//  ProductEmptyStateView.swift
//  Cash and Carry
//
//  Created by Edil on 21/07/2026.
//

import SwiftUI

struct ProductsEmptyStateView: View {

    let title: String
    let message: String

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            Image(systemName: "basket")
                .font(.system(size: 60))
                .foregroundColor(.gray.opacity(0.5))

            Text(title)
                .font(.custom("Outfit-SemiBold", size: 20))

            Text(message)
                .font(.custom("Outfit-Regular", size: 15))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 80)
    }
}

