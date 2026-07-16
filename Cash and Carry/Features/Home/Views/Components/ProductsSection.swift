//
//  ProductsSection.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct ProductsSection: View {

    let columns: [GridItem]
    let products: [Product]

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            HStack {

                Text("Popular Products")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
                
                Button{} label: {
                    Text("See All")
                        .font(.custom("Outfit-Medium", size: 14))
                }

            }

            LazyVGrid(columns: columns, spacing: 18) {

                ForEach(products) { product in
                    ProductCard(product: product)
                }

            }

        }
        .padding(.horizontal, 20)

    }

}
