//
//  RegisterView.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct RegisterView: View {

    @State private var fullName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var router: AppRouter

    var body: some View {

        ZStack {
            
            // White background
            Color.white
                .ignoresSafeArea()

            VStack {
                Spacer()
            
                
                AuthHeader(
                    title: "Create Account",
                    subtitle: "Join us to discover products from multiple stores and enjoy a seamless shopping experience."
                )

                Spacer()
                    .frame(height: 28)

                // MARK: Form

                VStack(spacing: 18) {

                    AppTextField(
                        title: "Full Name",
                        systemImage: "person",
                        text: $fullName
                    )

                    AppTextField(
                        title: "Email Address (Optional)",
                        systemImage: "envelope",
                        text: $email,
                        keyboard: .emailAddress
                    )

                    CountryCodePicker(phone: $phone)

                    AppSecureField(
                        title: "Password",
                        text: $password
                    )

                    AppSecureField(
                        title: "Confirm Password",
                        text: $confirmPassword
                    )

                    Spacer()
                        .frame(height: 8)

                    PrimaryButton(title: "Create Account") {

                    }

                }
                .padding(.horizontal, 30)

                Spacer()
                    .frame(height: 35)

                HStack(spacing: 5) {

                    Text("Already have an account?")
                        .font(.custom("Outfit-Regular", size: 16))
                        .foregroundColor(.gray)

                    Button {
                        router.pop()
                    } label: {

                        Text("Sign In")
                            .font(.custom("Outfit-Bold", size: 16))

                    }

                }

                    Spacer()
                    

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

