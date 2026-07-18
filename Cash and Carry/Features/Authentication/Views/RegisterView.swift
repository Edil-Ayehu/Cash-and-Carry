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
    
    @StateObject private var registerVM = DIContainer.shared.makeRegisterViewModel()
    
    private var isFormValid: Bool {
        !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !password.isEmpty &&
        !confirmPassword.isEmpty
    }

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

                    
                    PrimaryButton(
                        title: "Create Account",
                        isLoading: registerVM.isLoading,
                        isEnabled: isFormValid,
                        action: _handleRegister
                    )

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
                            .foregroundColor(Color.cyan)

                    }

                }

                    Spacer()
                    

            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: registerVM.isRegistered) {_, isRegistered in
            if isRegistered {
                router.setRoot(.login)
            }
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: { registerVM.errorMessage != nil},
                set: { _ in registerVM.errorMessage = nil}
            )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(registerVM.errorMessage ?? "Something went wrong!")
        }
    }
    
    func _handleRegister() {

        let trimmedName = fullName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedName.isEmpty else {
            registerVM.errorMessage = "Please enter your full name."
            return
        }

        guard !trimmedPhone.isEmpty else {
            registerVM.errorMessage = "Please enter your phone number."
            return
        }
        
        if !trimmedEmail.isEmpty {
                guard trimmedEmail.contains("@"),
                      trimmedEmail.contains(".") else {
                    registerVM.errorMessage = "Please enter a valid email address."
                    return
                }
        }

        guard !password.isEmpty else {
            registerVM.errorMessage = "Please enter your password."
            return
        }
        
        guard password.count >= 6 else {
                registerVM.errorMessage = "Password must be at least 6 characters long."
                return
            }

        guard !confirmPassword.isEmpty else {
            registerVM.errorMessage = "Please confirm your password."
            return
        }

        guard password == confirmPassword else {
            registerVM.errorMessage = "Passwords do not match."
            return
        }

        Task {
            await registerVM.register(
                name: trimmedName,
                phone: trimmedPhone,
                email: email,
                password: password
            )
        }
    }
}

