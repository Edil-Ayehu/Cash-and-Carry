//
//  HeaderIcon.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct HeaderIcon: View {

    let systemImage: String

    var body: some View {

        Button {

        } label: {

            Image(systemName: systemImage)
                .font(.title3)
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 2)

        }

    }

}
