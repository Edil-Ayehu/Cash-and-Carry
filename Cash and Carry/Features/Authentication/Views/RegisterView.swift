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

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    Spacer().frame(height: 60)

                    // MARK: Header

                    VStack(spacing: 10) {

                        Circle()
                            .fill(.white.opacity(0.15))
                            .frame(width: 90, height: 90)
                            .overlay {
                                Image(systemName: "person.badge.plus.fill")
                                    .font(.system(size: 34))
                                    .foregroundColor(.white)
                            }

                        Text("Create Account")
                            .font(.custom("Outfit-SemiBold", size: 28))
                            .foregroundColor(.black)

                        Text("Join us to discover products from multiple stores and enjoy a seamless shopping experience.")
                            .font(.custom("Outfit-Regular", size: 16))
                            .foregroundColor(.black.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)

                    }

                    Spacer()
                        .frame(height: 30)

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

                        } label: {

                            Text("Sign In")
                                .font(.custom("Outfit-Bold", size: 16))

                        }

                    }

                    Spacer()
                        .frame(height: 40)

                }
            }
        }
    }
}

