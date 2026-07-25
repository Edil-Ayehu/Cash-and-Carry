//
//  FavoriteDetailView.swift
//  Cash and Carry
//
//  Created by Edil on 25/07/2026.
//

import SwiftUI

struct FavoriteDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let favorite: FavoriteResponse

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
                    height: 50,
                    action: {
                        // Generate voucher
                    },
                )
                
                PrimaryButton(
                    title: "Delete Favorite",
                    height: 50,
                    bgColor: .red,
                    action: {
                        // Delete Favorite
                    },
                )

               
            }
            .padding()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
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
