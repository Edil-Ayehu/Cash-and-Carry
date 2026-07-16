//
//  ProductCard.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct ProductCard: View {
    
    let product: Product

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 140)
                .clipped()
            
            
            VStack (alignment: .leading){
                Text(product.category)
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
