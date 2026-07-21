//
//  CartView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct CartView: View {
    
    @Binding var selectedTab: Tab

    
    @StateObject private var cartVM = DIContainer.shared.makeCartViewModel()
    
    @State private var showDeleteConfirmationDialog: Bool = false

    var body: some View {

        VStack(spacing: 0) {

            // MARK: Header

            HStack {

                Spacer()

                Text("My Cart")
                    .font(.custom("Outfit-Medium", size: 18))

                Spacer()
                
                if (!cartVM.items.isEmpty) {
                    Button {
                        showDeleteConfirmationDialog = true
                    } label: {

                        Image(systemName: "trash")
                            .font(.system(size: 18))
                            .foregroundColor(.red)
                    }
                }

            }
            .padding(.horizontal)
            .padding(.top)

            // MARK: Cart Items
            
            if (cartVM.items.isEmpty) {
                emptyCartState
            } else {
                ScrollView(showsIndicators: false) {

                    LazyVStack(spacing: 18) {

                        ForEach($cartVM.items) { $item in

                            CartItemCard(item: $item)
                                .environmentObject(cartVM)
                        }
                    }
                    .padding()
                }
            }


            

            // MARK: Bottom Buttons
            
            if (!cartVM.items.isEmpty) {
                Divider()
                
                HStack(spacing: 16) {
                    
                    PrimaryButton(
                        title: "Generate Voucher",
                        action: {},
                        height: 48
                    )
                    
                    OutlinedButton(
                        title: "Add to Favorite",
                        action: {},
                        height: 48
                    )

                }
                .padding()
            }

            
        }
        .onAppear() {
             cartVM.loadCart()
        }
        .background(Color.white)
        .alert("Clear Cart", isPresented: $showDeleteConfirmationDialog) {
            Button("Cancel", role: .cancel) {}
            
            Button("Delete", role: .destructive) {
                cartVM.items.removeAll()
                
            }
        } message: {
            Text("Are you sure you want to remove all items from your cart?")
        }
    }
}



private extension CartView {
    var emptyCartState: some View {
        VStack(spacing: 20) {

                    Spacer()

                    Image(systemName: "cart")
                        .font(.system(size: 70))
                        .foregroundColor(.gray.opacity(0.6))

                    Text("Your cart is empty")
                        .font(.custom("Outfit-Medium", size: 22))

                    Text("Looks like you haven't added any products to your cart yet.")
                        .font(.custom("Outfit-Regular", size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)

                    PrimaryButton(
                        title: "Browse Products",
                        action: {
                            // Navigate to Products tab
                            selectedTab = .products
                        },
                        height: 48
                    )
                    .padding(.horizontal, 40)

                    Spacer()
                }
    }
}
