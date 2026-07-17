//
//  ForgotPasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct ForgotPasswordView: View {

    @State private var phone = ""

    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ZStack {
            
            // White background
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()
                
                AuthHeader(
                    title: "Forgot Password",
                    subtitle: "Enter your phone number and we'll send you a verification code to reset your password."
                )

                Spacer()
                    .frame(height: 35)

                // MARK: Form

                VStack(spacing: 24) {

                    CountryCodePicker(phone: $phone)
                    
                    Spacer().frame(height: 8)
                    
                    PrimaryButton(
                        title: "Send Code",
                        action: {
                            router.push(.resetPassword)
                        }
                    )


                }
                .padding(.horizontal, 30)

                Spacer()

                Button {
                    router.pop()
                } label: {

                    HStack(spacing: 6) {

                        Image(systemName: "chevron.left")

                        Text("Back to Sign In")
                            .font(.custom("Outfit-Medium", size: 16))
                            .foregroundColor(Color.cyan)

                    }

                }
                .padding(.bottom, 35)

            }

        }
        .navigationBarBackButtonHidden()
    }
}

