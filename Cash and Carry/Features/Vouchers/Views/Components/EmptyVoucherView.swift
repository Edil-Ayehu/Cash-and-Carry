//
//  EmptyVoucherView.swift
//  Cash and Carry
//
//  Created by Edil on 19/07/2026.
//

import SwiftUI

struct EmptyVoucherView: View {

    let title: String
    let subtitle: String

    var body: some View {
        VStack(spacing: 10) {

            Image(systemName: "tag")
                .font(.system(size: 42))
                .foregroundColor(.gray)

            Text(title)
                .font(.custom("Outfit-Medium", size: 16))

            Text(subtitle)
                .font(.custom("Outfit-Regular", size: 14))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 50)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding()
    }
}
