//
//  VoucherCard.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct VoucherCard: View {

    let voucher: MyVoucherResponse

    var body: some View {

        VStack(spacing: 0) {

            // Header

            HStack(spacing: 14) {

                ZStack {

                    Circle()
                        .fill(Color.white.opacity(0.12))
                        .frame(width: 40, height: 40)

                    Image(systemName: "basket")
                        .foregroundColor(.white)
                }

                Text("\(voucher.items.count) Products")
                    .font(.custom("Outfit-SemiBold", size: 16))
                    .foregroundColor(.white)

                Spacer()
            }
            .padding(12)
            .background(Color.black)

            VStack(alignment: .leading, spacing: 16) {

                Text("Voucher Code")
                    .font(.custom("Outfit-Medium", size: 16))

                HStack {

                    Text(voucher.code)
                        .font(.custom("Outfit-SemiBold", size: 20))
                        .foregroundColor(Color.cyan)

                    Spacer()

                    Button {

                        UIPasteboard.general.string = voucher.code

                    } label: {

                        Image(systemName: "doc.on.doc")
                            .font(.title3)
                            .foregroundColor(Color.cyan)
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 58)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(Color.gray.opacity(0.2))
                )

                HStack(spacing: 8) {

                    Image(systemName: "hand.tap")
                        .foregroundColor(.gray)

                    Text("Tap to view voucher details")
                        .font(.custom("Outfit-Regular", size: 14))
                        .foregroundColor(.black.opacity(0.8))
                }
            }
            .padding(20)
            .background(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.06), radius: 12)
    }
}
