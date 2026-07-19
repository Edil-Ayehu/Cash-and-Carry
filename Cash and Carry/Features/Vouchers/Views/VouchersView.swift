//
//  VouchersView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct VouchersView: View {

    @State private var selectedTab = 0
    
    @EnvironmentObject var myVoucherVM: MyVoucherViewModel
    
    private var pendingVouchers: [MyVoucherResponse] {
        myVoucherVM.vouchers.filter { $0.status == "PENDING" }
    }
    
    private var completedVouchers: [MyVoucherResponse] {
        myVoucherVM.vouchers.filter { $0.status == "COMPLETED" }
    }
    
    private var displayedVouchers: [MyVoucherResponse] {
        selectedTab == 0 ? pendingVouchers : completedVouchers
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

                    Text("\(displayedVouchers.count)")
                        .font(.custom("Outfit-Medium", size: 16))
                        .foregroundColor(.gray)
                }

                LazyVStack(spacing: 20) {
                    if myVoucherVM.isLoading {
                        ForEach(0..<8) { _ in
                            VoucherCardSkeleton()
                        }
                    } else if displayedVouchers.isEmpty {
                        EmptyVoucherView(
                            title: selectedTab == 0 ? "No Pending Vouchers" : "No Redeemed Vouchers",
                            subtitle: selectedTab == 0 ? "You don't have any pending vouchers yet." : "Your redeemed vouchers will appear here."
                        )
                    }
                    else {
                        ForEach(displayedVouchers) { voucher in
                            VoucherCard(voucher: voucher)
                        }
                        
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

