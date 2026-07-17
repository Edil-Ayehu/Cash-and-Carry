//
//  ProfileMenuRow.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ProfileMenuRow: View {

    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 18) {

                Image(systemName: icon)
                    .font(.system(size: 18))
                    .frame(width: 28)
                    .foregroundColor(.black)

                Text(title)
                    .font(.custom("Outfit-Regular", size: 16))
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
            .padding(.vertical, 10)
        }
    }
}
