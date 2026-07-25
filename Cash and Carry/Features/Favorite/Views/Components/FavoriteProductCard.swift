//
//  FavoriteProductCard.swift
//  Cash and Carry
//
//  Created by Edil on 25/07/2026.
//

import SwiftUI

struct FavoriteProductCard: View {

    let item: FavoriteItemResponse

    var body: some View {

        HStack(spacing: 18) {

            productImage

            VStack(alignment: .leading, spacing: 10) {

                Text(item.product.name)
                    .font(.custom("Outfit-Medium", size: 16))

                Text("Qty \(item.quantity)")
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.blue)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 8)
                    .background(Color.blue.opacity(0.15))
                    .clipShape(Capsule())
            }

            Spacer()
        }
    }
}

private extension FavoriteProductCard {

    @ViewBuilder
    var productImage: some View {

        if let url = URL(string: item.product.image),
           !item.product.image.isEmpty {

            AsyncImage(url: url) { phase in

                switch phase {

                case .empty:

                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 60, height: 60)

                case .success(let image):

                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 18))

                case .failure:

                    placeholder

                @unknown default:

                    placeholder
                }
            }

        } else {

            placeholder
        }
    }

    var placeholder: some View {

        RoundedRectangle(cornerRadius: 18)
            .fill(Color.gray.opacity(0.15))
            .frame(width: 60, height: 60)
            .overlay(
                Image(systemName: "photo")
                    .font(.system(size: 24))
                    .foregroundColor(.gray.opacity(0.6))
            )
    }
}
