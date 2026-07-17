//
//  ProfileInfoRow.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ProfileInfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(spacing: 18) {

            Image(systemName: icon)
                .font(.system(size: 18))
                .frame(width: 36)
                .foregroundColor(.black)

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.gray)

                Text(value)
                    .font(.custom("Outfit-Medium", size: 16))
            }

            Spacer()
        }
    }
}
