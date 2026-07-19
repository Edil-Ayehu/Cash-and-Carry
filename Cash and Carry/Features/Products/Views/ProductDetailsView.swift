//
//  ProductDetailsView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ProductDetailsView: View {

    @Environment(\.dismiss) private var dismiss

    let product: ProductResponse

    var body: some View {

        VStack(spacing: 0) {

            header
            
            Spacer().frame(height: 12)
            
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)


            productDetails
            
            

        }
        .navigationBarBackButtonHidden()
        .background(Color.white)
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

                Text("Premium refined sunflower cooking oil")
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.black.opacity(0.85))
            }

            Spacer(minLength: 80)
            
            PrimaryButton(
                title: "Add to Cart",
                action: {}
            )
        }
        .padding(.horizontal)
        .padding(.top, 24)
    }
}
