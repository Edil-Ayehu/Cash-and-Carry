//
//  ProductCard.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct ProductCard: View {
    
    let product: ProductResponse

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            
            productImage
            
            
            VStack (alignment: .leading){
                Text(product.category.name)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.cyan)

                Text(product.name)
                    .font(.custom("Outfit-Medium", size: 16))
            }.padding()

            

        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.04), radius: 8)

    }

}


private extension ProductCard {

    @ViewBuilder
    var productImage: some View {

        if let url = URL(string: product.image), !product.image.isEmpty {

            AsyncImage(url: url) { phase in

                switch phase {

                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 140)
                        .clipped()

                case .failure(_):
                    placeholderImage

                @unknown default:
                    placeholderImage
                }
            }

        } else {
            placeholderImage
        }
    }

    var placeholderImage: some View {
        Image(systemName: "photo")
            .font(.system(size: 40))
            .foregroundColor(.gray.opacity(0.6))
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .background(Color.gray.opacity(0.08))
    }
}
