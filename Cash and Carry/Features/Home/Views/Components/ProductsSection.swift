//
//  ProductsSection.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct ProductsSection: View {
    
    @Binding var selectedTab: Tab
    
    @EnvironmentObject var router: AppRouter
    
    @EnvironmentObject var productVM: ProductViewModel
    
    @StateObject var cartVM = DIContainer.shared.makeCartViewModel()
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            HStack {

                Text("Popular Products")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
                
                Button{
                    selectedTab = .products
                } label: {
                    Text("See All")
                        .font(.custom("Outfit-Medium", size: 14))
                        .foregroundColor(.cyan)
                }

            }
            
            

            LazyVGrid(columns: columns, spacing: 18) {
                if productVM.isLoading {
                    ForEach(0..<4) {_ in
                        ProductCardSkeleton()
                    }
                } else {
                    ForEach(productVM.products.prefix(4)) { product in
                        ProductCard(product: product)
                            .onTapGesture {
                                router.push(.productDetails(product))
                            }
                            .environmentObject(cartVM)
                    }
                }


            }

        }
        .padding(.horizontal, 20)
        .onAppear {
            cartVM.loadCart()
        }

    }

}
