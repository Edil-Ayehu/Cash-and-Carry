//
//  VouchersView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct VouchersView: View {

    @State private var selectedTab = 0

    private let vouchers = [
        Voucher(code: "RTODRDM3CX", productCount: 3, isRedeemed: false),
        Voucher(code: "NQ_9FBXUTV", productCount: 3, isRedeemed: false),
        Voucher(code: "ABC123XYZ", productCount: 2, isRedeemed: true)
    ]

    var filteredVouchers: [Voucher] {
        vouchers.filter {
            selectedTab == 0 ? !$0.isRedeemed : $0.isRedeemed
        }
    }

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 24) {

                Text("My Orders")
                    .font(.custom("Outfit-Medium", size: 18))
                    .frame(maxWidth: .infinity)

                picker

                HStack {

                    Text(selectedTab == 0 ? "Pending Vouchers" : "Completed Vouchers")
                        .font(.custom("Outfit-Medium", size: 16))

                    Spacer()

                    Text("\(filteredVouchers.count)")
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(.gray)
                }

                LazyVStack(spacing: 20) {

                    ForEach(filteredVouchers) { voucher in
                        VoucherCard(voucher: voucher)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGray6).opacity(0.15))
    }

    private var picker: some View {

        HStack(spacing: 0) {

            tabButton(title: "Pending", index: 0)

            tabButton(title: "Completed", index: 1)
        }
        .padding(4)
        .background(Color.white)
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(Color.gray.opacity(0.2))
        )
    }

    private func tabButton(title: String, index: Int) -> some View {

        Button {

            withAnimation(.easeInOut) {
                selectedTab = index
            }

        } label: {

            Text(title)
                .font(.custom("Outfit-Medium", size: 16))
                .foregroundColor(selectedTab == index ? .white : .black.opacity(0.8))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    selectedTab == index
                    ? Color.black
                    : Color.clear
                )
                .clipShape(Capsule())
        }
    }
}

