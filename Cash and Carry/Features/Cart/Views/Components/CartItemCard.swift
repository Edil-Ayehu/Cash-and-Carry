//
//  CartItemCard.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct CartItemCard: View {

    @Binding var item: CartItem
    
    @EnvironmentObject var cartVM: CartViewModel

    var body: some View {

        HStack(spacing: 18) {

            AsyncImage(url: URL(string: item.product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 64, height: 64)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 16))

                case .failure:
                    placeholderImage

                @unknown default:
                    placeholderImage
                }
            }

            Text(item.product.name)
                .font(.custom("Outfit-Medium", size: 16))
                .lineLimit(2)

            Spacer()

            HStack(spacing: 14) {

                Button {

//                    if item.quantity > 1 {
//                        item.quantity -= 1
//                    }
                    cartVM.decrease(item)

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

//                    item.quantity += 1
                    cartVM.increase(item)

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
    
    private var placeholderImage: some View {
        Image(systemName: "photo")
            .font(.system(size: 24))
            .foregroundColor(.gray.opacity(0.6))
            .frame(width: 64, height: 64)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
