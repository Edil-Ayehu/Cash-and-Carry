//
//  VoucherProductRow.swift
//  Cash and Carry
//
//  Created by Edil on 23/07/2026.
//

import SwiftUI

struct VoucherProductRow: View {

    let item: VoucherItemResponse

    var body: some View {

        HStack(spacing: 16) {

            productImage

            VStack(alignment: .leading, spacing: 6) {

                Text(item.product.name)
                    .font(.custom("Outfit-Medium", size: 16))

                Text("Qty: \(item.quantity)")
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(8)
        .background(Color(.systemGray6).opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    @ViewBuilder
    private var productImage: some View {

        if let url = URL(string: item.product.image),
           !item.product.image.isEmpty {

            AsyncImage(url: url) { phase in

                switch phase {

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()

                case .empty:
                    ProgressView()

                default:
                    placeholder
                }
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 16))

        } else {

            placeholder
        }
    }

    private var placeholder: some View {

        Image(systemName: "photo")
            .font(.system(size: 24))
            .foregroundColor(.gray)
            .frame(width: 52, height: 52)
            .background(Color.gray.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
