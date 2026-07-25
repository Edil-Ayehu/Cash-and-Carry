//
//  FavoriteDetailView.swift
//  Cash and Carry
//
//  Created by Edil on 25/07/2026.
//

import SwiftUI
import AlertToast

struct FavoriteDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let favorite: FavoriteResponse
    
    @StateObject private var voucherVM = DIContainer.shared.makeGenerateVoucherViewModel()
    
    @StateObject private var deleteFavVM = DIContainer.shared.makeDeleteFavViewModel()
    
    @EnvironmentObject private var router: AppRouter
    
    @State private var showGenerateSuccessDialog: Bool = false
    
    
    var body: some View {

        VStack(spacing: 0) {

            header

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    favoriteHeader

                    LazyVStack(spacing: 20) {
                        ForEach(favorite.items) { item in
                            FavoriteProductCard(item: item)
                        }
                    }
                }
                .padding()
            }

            Divider()

            HStack(spacing: 16) {

                PrimaryButton(
                    title: "Generate Voucher",
                    isLoading: voucherVM.isLoading,
                    height: 50,
                    action: {
                        // Generate voucher
                        let request = GenerateVoucherRequest(
                            items: favorite.items.map {
                                GenerateVoucherItemRequest(
                                    productId: $0.productId,
                                    quantity: $0.quantity
                                )
                            }
                        )
                        Task {
                            await voucherVM.generateVoucher(request: request)
                        }
                    },
                )
                
                
                PrimaryButton(
                    title: "Delete Favorite",
                    isLoading: deleteFavVM.isLoading,
                    height: 50,
                    bgColor: .red,
                    action: {
                        // Delete Favorite
                        Task {
                            await deleteFavVM.deleteFavorite(
                                id: favorite.id
                            )
                        }
                    },
                )

               
            }
            .padding()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
        .onChange(of: voucherVM.code) { _, code in
            if code != nil {
                showGenerateSuccessDialog = true
            }
        }
        
        .overlay {
            if showGenerateSuccessDialog,
               let code = voucherVM.code {
                VoucherSuccessDialog(
                    voucherCode: code,
                    onDismiss: {
                        showGenerateSuccessDialog = false
                    }
                )
            }
        }
        
        .onChange(of: deleteFavVM.isDeleted) {_, isDeleted in
            if isDeleted {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    router.pop()
                }
            }
            
        }
        
        .toast( isPresenting: $deleteFavVM.isDeleted) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: deleteFavVM.successMessage
            )
        }

    }
}


private extension FavoriteDetailView {

    var header: some View {

        HStack {

            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .medium))
            }

            Spacer()

            Text(favorite.name ?? "Favorite")
                .font(.custom("Outfit-Medium", size: 16))

            Spacer()

            Image(systemName: "chevron.left")
                .opacity(0)
        }
        .foregroundColor(.black)
        .padding()
    }
    
    var favoriteHeader: some View {

            HStack(spacing: 18) {

                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.pink.opacity(0.15))
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                    )

                VStack(alignment: .leading, spacing: 6) {

                    Text(favorite.name ?? "Unnamed Favorite")
                        .font(.custom("Outfit-Medium", size: 16))

                    Text("\(favorite.items.count) product\(favorite.items.count == 1 ? "" : "s")")
                        .font(.custom("Outfit-Regular", size: 14))
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding(20)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .shadow(color: .black.opacity(0.05), radius: 8)
        }
}
