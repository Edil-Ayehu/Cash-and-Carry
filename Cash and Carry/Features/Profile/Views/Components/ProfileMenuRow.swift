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
    var isLogout: Bool = false
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 18) {

                Image(systemName: icon)
                    .font(.system(size: 18))
                    .frame(width: 28)
                    .foregroundColor(isLogout ? .red : .black)

                Text(title)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(isLogout ? .red : .black)

                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(isLogout ? .red : .black)
                

                
            }
            .padding(.vertical, 10)
        }
    }
}
