//
//  ProductsView.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//

import SwiftUI

struct ProductsView: View {

    @State private var searchText = ""
    @State private var selectedCategory = "All"

    private let columns = [
        GridItem(.flexible(), spacing: 18),
        GridItem(.flexible(), spacing: 18)
    ]

    let categories = [
        "All",
        "Soft Drinks",
        "Energy drinks"
    ]
    
    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 20) {

                Text("Products")
                    .font(.custom("Outfit-Medium", size: 18))
                    .frame(maxWidth: .infinity)

                searchBar

                categorySection

                LazyVGrid(columns: columns, spacing: 20) {

                    ForEach(Product.dummyProducts) { product in

                        ProductCard(product: product)
                            .onTapGesture {
                                router.push(.productDetails(product))
                            }
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

private extension ProductsView {

    var searchBar: some View {

        HStack(spacing: 12) {

            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(
                "Search your favorite drinks or meals...",
                text: $searchText
            )
            .font(.custom("Outfit-Regular", size: 14))
        }
        .padding()
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.2))
        )
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    var categorySection: some View {

        ScrollView(.horizontal, showsIndicators: false) {

            HStack(spacing: 12) {

                ForEach(categories, id: \.self) { category in

                    Button {

                        selectedCategory = category

                    } label: {

                        Text(category)
                            .font(.custom(selectedCategory == category ? "Outfit-Medium": "Outfit-Regular", size: 14))
                            .foregroundColor(
                                selectedCategory == category ? .white : .black
                            )
                            .padding(.horizontal, 24)
                            .frame(height: 50)
                            .background(
                                selectedCategory == category
                                ? Color.black
                                : Color(.systemGray6)
                            )
                            .clipShape(Capsule())
                    }
                }
            }
        }
    }
}

