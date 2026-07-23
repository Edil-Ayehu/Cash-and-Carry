//
//  ProductCard.swift
//  Cash and Carry
//
//  Created by Edil on 16/07/2026.
//
import SwiftUI

struct ProductCard: View {
    
    let product: ProductResponse
    
    @State private var isAnimating = false
    
    @EnvironmentObject var cartVM: CartViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            productImage
            
            HStack {
                VStack (alignment: .leading){
                    Text(product.category.name)
                        .font(.custom("Outfit-Medium", size: 14))
                        .foregroundColor(.cyan)
                    
                    Text(product.name)
                        .font(.custom("Outfit-Medium", size: 16))
                }.padding()
                
                Spacer()
                
                if !cartVM.contains(productId: product.id) {
                    Button{
                        print("Added to cart")
                        Task {
                            await cartVM.add(product: product)
                        }
                        
                    } label: {
                        if cartVM.loadingProductId == product.id {
                            ProgressView()
                                .padding(.trailing, 8)
                        } else {
                            Image(systemName: "cart.badge.plus")
                                .font(.system(size: 14))
                                .padding(6)
                                .background(Circle().fill(Color.black))
                                .foregroundColor(.white)
                                .cornerRadius(4)
                                .padding(.trailing, 8)
                        }
                    }
                }
                
                
            }
            
            
            
            
            
            
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
                    imageSkeleton
                    
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
    
    var imageSkeleton: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.gray.opacity(0.18))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.clear,
                                Color.white.opacity(0.6),
                                Color.clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .offset(x: isAnimating ? 250 : -250)
            )
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .onAppear {
                withAnimation(
                    .linear(duration: 1.1)
                    .repeatForever(autoreverses: false)
                ) {
                    isAnimating = true
                }
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
