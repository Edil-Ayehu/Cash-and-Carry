//
//  FavoriteEmptyStateView.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import SwiftUI

struct FavoriteEmptyStateView: View {

    var body: some View {

        VStack(spacing: 14) {

            Spacer()


            Image(systemName: "heart")
                .font(.system(size: 40))
                .foregroundColor(.red.opacity(0.5))
                .frame(width: 90, height: 90)
                .background(
                    Circle()
                        .fill(Color.red.opacity(0.08))
                )


            Text("No Favorites Yet")
                .font(.custom("Outfit-SemiBold", size: 18))


            Text(
                "You haven't added any products to your favorites yet. Add products you love and find them here easily."
            )
            .font(.custom("Outfit-Regular", size: 14))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)


            Spacer()

        }
        .frame(maxWidth: .infinity)
    }
}
