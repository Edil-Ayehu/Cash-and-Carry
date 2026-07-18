//
//  ForgotPasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI
import AlertToast

struct ForgotPasswordView: View {

    @State private var phone = ""

    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var forgotPasswordVM = DIContainer.shared.makeForgotPasswordViewModel()
    
    @State private var showSuccessAlert: Bool = false
    
    var isFormValid: Bool {
        !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        phone.count >= 9
    }

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
                        isLoading: forgotPasswordVM.isLoading,
                        isEnabled: isFormValid,
                        action: _handleSendCode
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
        .onChange(of: forgotPasswordVM.isOTPSent) { _, isOTPSent in
            if isOTPSent {
                showSuccessAlert = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    router.push(.resetPassword)
                })
            }
            
        }
        .alert("Error", isPresented: Binding(
            get: {forgotPasswordVM.errorMessage != nil},
            set: {_ in forgotPasswordVM.errorMessage = nil}
        )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(forgotPasswordVM.errorMessage ?? "Something went wrong. Please try again later.")
        }
        
        .toast(isPresenting: $showSuccessAlert) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: forgotPasswordVM.successMessage
            )
        }
    }
    
    func _handleSendCode() {
        let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedPhone.isEmpty else {
            forgotPasswordVM.errorMessage = "Please enter your phone number."
            return
        }
        
        Task {
            await forgotPasswordVM.forgotPassword(phone: phone)
        }
    }
}


