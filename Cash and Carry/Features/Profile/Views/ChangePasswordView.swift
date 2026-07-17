//
//  ChangePasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ChangePasswordView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject private var router: AppRouter

    var body: some View {

        VStack(alignment: .leading, spacing: 0) {

            // MARK: Header

            HStack(spacing: 16) {

                Button {
                    dismiss()
                } label: {

                    Image(systemName: "chevron.left")
                        .font(.title3.weight(.medium))
                        .foregroundColor(.black)
                }

                Text("Change Password")
                    .font(.custom("Outfit-Medium", size: 16))

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView(showsIndicators: false) {
                
                Spacer().frame(height: 12)

                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading, spacing: 8) {

                        Text("Update Your Password")
                            .font(.custom("Outfit-SemiBold", size: 18))

                        Text("Choose a strong password to keep your account secure.")
                            .font(.custom("Outfit-Regular", size: 16))
                            .foregroundColor(.gray)
                    }

                    AppSecureField(
                        title: "Old Password",
                        prefixIcon: "lock",
                        text: $oldPassword
                    )

                    AppSecureField(
                        title: "New Password",
                        prefixIcon: "key",
                        text: $newPassword
                    )

                    AppSecureField(
                        title: "Confirm Password",
                        prefixIcon: "lock.rotation",
                        text: $confirmPassword
                    )

                    Spacer(minLength: 60)
                }
                .padding()
            }

            PrimaryButton(
                title: "Change Password",
                action: {
                    // Change password
                    router.pop()
                }
                
            )
            .padding()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
    }
}

