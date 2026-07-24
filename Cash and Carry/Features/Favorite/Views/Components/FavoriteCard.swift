//
//  FavoriteCard.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import SwiftUI


struct FavoriteCard: View {

    let favorite: FavoriteResponse


    var body: some View {

        VStack(spacing: 18) {


            HStack {

                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.pink.opacity(0.15))
                    .frame(width: 70, height: 70)
                    .overlay {

                        Image(systemName: "heart.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                    }


                VStack(alignment: .leading, spacing: 8) {


                    Text(favorite.name ?? "Wishlist Items")
                        .font(.custom("Outfit-SemiBold", size: 18))


                    HStack(spacing: 6) {

                        Image(systemName: "clock")
                            .font(.system(size: 14))

                        Text(
                            favorite.createdAt.formattedDate()
                        )
                        .font(.custom("Outfit-Regular", size: 14))
                        .foregroundColor(.gray)

                    }

                }


                Spacer()


                Image(systemName: "chevron.right")
                    .font(.system(size: 20))
            }



            HStack {


                productImages


                Spacer()


                Text("\(favorite.items.count) Items")
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.green)
                    .padding(.horizontal,18)
                    .padding(.vertical,12)
                    .background(
                        Capsule()
                            .fill(Color.green.opacity(0.12))
                    )

            }

        }
        .padding()
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
        )
        .shadow(
            color: .black.opacity(0.05),
            radius: 8
        )
    }



    private var productImages: some View {

        HStack(spacing: -18) {


            ForEach(
                favorite.items.prefix(3)
            ) { item in


                AsyncImage(
                    url: URL(
                        string: item.product.image
                    )
                ) { phase in


                    switch phase {


                    case .empty:

                        imagePlaceholder


                    case .success(let image):

                        image
                            .resizable()
                            .scaledToFill()


                    default:

                        imagePlaceholder
                    }

                }
                .frame(
                    width: 55,
                    height: 55
                )
                .clipShape(Circle())
                .overlay {

                    Circle()
                        .stroke(
                            Color.white,
                            lineWidth: 3
                        )
                }
            }

        }
    }



    var imagePlaceholder: some View {

        Image(systemName: "photo")
            .foregroundColor(.gray)
            .background(
                Color.gray.opacity(0.15)
            )
    }
}
