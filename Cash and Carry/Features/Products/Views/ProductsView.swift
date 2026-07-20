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
    
    @EnvironmentObject private var router: AppRouter
    
    @EnvironmentObject private var productVM: ProductViewModel
    
    @StateObject private var categoryVM = DIContainer.shared.makeCategoryViewModel()
    
    private var categories: [CategoryResponse] {
        let all = CategoryResponse(
            id: "",
            name: "All"
        )
        
        return [all] + categoryVM.categories
    }

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(alignment: .leading, spacing: 20) {

                Text("Products")
                    .font(.custom("Outfit-Medium", size: 18))
                    .frame(maxWidth: .infinity)

                searchBar

                categorySection
                
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    if productVM.isLoading {
                        ForEach(0..<8) { _ in
                            ProductCardSkeleton()
                        }
                    } else {
                        ForEach(productVM.products) { product in

                            ProductCard(product: product)
                                .onTapGesture {
                                    router.push(.productDetails(product))
                                }
                        }
                    }

                    
                }

                
            }
            .padding()
        }
        .background(Color.white)
        .task {
            await categoryVM.fetchCategories()
        }
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
                if categoryVM.isLoading {
                    ForEach(0..<5, id: \.self) { _ in
                            CategoryChipSkeleton()
                        }
                } else {
                    ForEach(categories) { category in

                        Button {
                            
                            guard selectedCategory != category.name else {
                                return
                            }

                            selectedCategory = category.name
                            
                            Task {
                                await productVM.fetchProducts(category: selectedCategory == "All" ? nil: category.name)
                            }

                        } label: {

                            Text(category.name)
                                .font(.custom(selectedCategory == category.name ? "Outfit-Medium": "Outfit-Regular", size: 14))
                                .foregroundColor(
                                    selectedCategory == category.name ? .white : .black
                                )
                                .padding(.horizontal, 24)
                                .frame(height: 50)
                                .background(
                                    selectedCategory == category.name
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
}

