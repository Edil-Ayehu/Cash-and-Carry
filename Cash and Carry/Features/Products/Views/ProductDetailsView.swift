//
//  ProductDetailsView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI
import AlertToast

struct ProductDetailsView: View {

    @Environment(\.dismiss) private var dismiss

    let product: ProductResponse
    
    @StateObject var cartVM = DIContainer.shared.makeCartViewModel()

    var body: some View {

        VStack(spacing: 0) {

            header
            
            Spacer().frame(height: 12)
            
            productImage


            productDetails
            
            

        }
        .navigationBarBackButtonHidden()
        .background(Color.white)
        .toast(isPresenting: $cartVM.productAdded) { 
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "\(product.name) Product added to cart"
            )
        }
    }
}


private extension ProductDetailsView {
    
    var header: some View {
        HStack {

            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3.weight(.medium))
                    .foregroundColor(.black)
            }

            Spacer()

            Text("Product Details")
                .font(.custom("Outfit-Medium", size: 16))

            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    var productDetails: some View {
        
        VStack(alignment: .leading, spacing: 24) {

            VStack(alignment: .leading, spacing: 8) {

                Text(product.name)
                    .font(.custom("Outfit-SemiBold", size: 16))
                    .foregroundColor(.black)

                Text(product.description)
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.black.opacity(0.85))
            }

            Spacer(minLength: 80)
            
            PrimaryButton(
                title: cartVM.contains(productId: product.id) ? "In Cart" : "Add to Cart",
                isLoading: cartVM.loadingProductId == product.id,
                isEnabled: !cartVM.contains(productId: product.id),
                action: {
                    Task {
                        await cartVM.add(product: product)
                        
                    }
                }
            )
        }
        .padding(.horizontal)
        .padding(.top, 24)
    }
    
    
    @ViewBuilder
    var productImage: some View {

        if let url = URL(string: product.image), !product.image.isEmpty {

            AsyncImage(url: url) { phase in

                switch phase {

                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 280)

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
            .font(.system(size: 60))
            .foregroundColor(.gray.opacity(0.6))
            .frame(maxWidth: .infinity)
            .frame(height: 280)
            .background(Color.gray.opacity(0.08))
    }
}
