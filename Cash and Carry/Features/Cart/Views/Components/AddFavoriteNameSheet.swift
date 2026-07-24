//
//  AddFavoriteNameSheet.swift
//  Cash and Carry
//
//  Created by Edil on 24/07/2026.
//

import SwiftUI

struct AddFavoriteNameSheet: View {

    @Binding var name: String
    
    let onSave: () -> Void

    @Environment(\.dismiss) private var dismiss


    var body: some View {

        VStack(spacing: 24) {

//            Capsule()
//                .fill(Color.gray.opacity(0.4))
//                .frame(width: 40, height: 5)
//                .padding(.top, 12)


            Text("Add to Favorite")
                .font(.custom("Outfit-Medium", size: 18))


            VStack(alignment: .leading, spacing: 8) {

                Text("Favorite Name (Optional)")
                    .font(.custom("Outfit-Medium", size: 14))


                TextField(
                    "Example: Weekly Grocery",
                    text: $name
                )
                .font(.custom("Outfit-Regular", size: 14))
                .padding()
                .background(Color(.systemGray6))
                .clipShape(
                    RoundedRectangle(cornerRadius: 14)
                )
            }


            PrimaryButton(
                title: "Save",
                height: 48
            ) {
                onSave()
            }
        }
        .padding(.horizontal)
    }
}
