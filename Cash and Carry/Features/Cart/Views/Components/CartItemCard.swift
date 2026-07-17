//
//  CartItemCard.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct CartItemCard: View {

    @Binding var item: CartItem

    var body: some View {

        HStack(spacing: 18) {

            Image(item.product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(item.product.name)
                .font(.custom("Outfit-Medium", size: 16))
                .lineLimit(2)

            Spacer()

            HStack(spacing: 14) {

                Button {

                    if item.quantity > 1 {
                        item.quantity -= 1
                    }

                } label: {

                    Image(systemName: "minus")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }

                Text("\(item.quantity)")
                    .font(.custom("Outfit-Medium", size: 16))
                    .frame(width: 20)

                Button {

                    item.quantity += 1

                } label: {

                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                        .background(Color.black)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }
}
