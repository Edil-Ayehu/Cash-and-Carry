//
//  VoucherSuccessDialog.swift
//  Cash and Carry
//
//  Created by Edil on 23/07/2026.
//

import SwiftUI

struct VoucherSuccessDialog: View {

    let voucherCode: String
    let onDismiss: () -> Void

    var body: some View {

        ZStack {

            Color.black.opacity(0.45)
                .ignoresSafeArea()

            VStack(spacing: 24) {

                Circle()
                    .fill(Color.green.opacity(0.12))
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "checkmark.seal")
                            .font(.system(size: 44))
                            .foregroundColor(.green)
                    )

                Text("Pre-Order Confirmed!")
                    .font(.custom("Outfit-SemiBold", size: 18))

                Text("Your items are reserved and ready for pickup.")
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                VStack(spacing: 10) {

                    Text("VOUCHER CODE")
                        .font(.custom("Outfit-Medium", size: 14))
                        .foregroundColor(.gray)
                        .tracking(2)

                    HStack {

                        Text(voucherCode)
                            .font(.custom("Outfit-SemiBold", size: 20))
                            .foregroundColor(.cyan)

                        Spacer()

                        Button {

                            UIPasteboard.general.string = voucherCode

                        } label: {

                            Text("Copy Code")
                                .font(.custom("Outfit-Medium", size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .frame(height: 38)
                                .background(Color.black)
                                .clipShape(Capsule())
                        }
                    }
                }

                HStack(alignment: .top, spacing: 14) {

                    Image(systemName: "storefront")

                    Text("Pick up your reserved items from the store by presenting this voucher code and completing your payment.")
                        .font(.custom("Outfit-Regular", size: 12))
                }
                .padding()
                .background(Color.orange.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 18))

                PrimaryButton(
                    title: "Got It",
                    height: 48
                ) {
                    onDismiss()
                }
            }
            .padding(28)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .padding(.horizontal, 28)
        }
    }
}
