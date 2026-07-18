//
//  ResetPasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI
import AlertToast

struct ResetPasswordView: View {
    
    let phone: String

    @State private var verificationCode = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @State private var showSuccessAlert: Bool = false

    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var resetPasswordVM = DIContainer.shared.makeResetPasswordViewModel()
    
    var isFormValid : Bool {
        !verificationCode.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !newPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        newPassword.count >= 6
    }

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                AuthHeader(
                    title: "Reset Password",
                    subtitle: "Enter the verification code sent to your phone and choose a new password."
                )

                Spacer()
                    .frame(height: 35)

                // MARK: Form

                VStack(spacing: 22) {

                    AppTextField(
                        title: "Verification Code",
                        systemImage: "number",
                        text: $verificationCode,
                        keyboard: .numberPad
                    )

                    AppSecureField(
                        title: "New Password",
                        text: $newPassword
                    )

                    AppSecureField(
                        title: "Confirm New Password",
                        text: $confirmPassword
                    )

                    Spacer()
                        .frame(height: 8)
                    
                    PrimaryButton(
                        title: "Reset Password",
                        isLoading: resetPasswordVM.isLoading,
                        isEnabled: isFormValid,
                        action: _handleResetPassword,
                    )

                }
                .padding(.horizontal, 30)

                Spacer()

                Button {

                    router.pop()

                } label: {

                    HStack(spacing: 6) {

                        Image(systemName: "chevron.left")

                        Text("Back")
                            .font(.custom("Outfit-Medium", size: 16))
                            .foregroundColor(Color.cyan)

                    }

                }
                .padding(.bottom, 35)

            }

        }
        .navigationBarBackButtonHidden()
        .onChange(of: resetPasswordVM.passwordReseted) {_, passwordReseted in
            if passwordReseted {
                showSuccessAlert = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    router.setRoot(.login)
                })
            }
        }
        .alert("Error", isPresented: Binding(
            get: {resetPasswordVM.errorMessage != nil},
            set: { _ in resetPasswordVM.errorMessage = nil}
        )) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(resetPasswordVM.errorMessage ?? "Something went wrong. Please try again later.")
        }
        
        .toast(isPresenting: $showSuccessAlert) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Password reset successfully!"
            )
        }
    }
    
    func _handleResetPassword() {
        
        guard !verificationCode.isEmpty else {
            resetPasswordVM.errorMessage = "Verification code is required."
            return
        }
        
        guard verificationCode.count == 6 else {
            resetPasswordVM.errorMessage = "Verification code must be 6 digits long."
            return
        }
        
        guard newPassword == confirmPassword else {
            resetPasswordVM.errorMessage = "New passwords do not match."
            return
        }
        
        Task {
            await resetPasswordVM.resetPassword(
                phone: phone,
                code: verificationCode,
                newPassword: newPassword
            )
        }
    }
}
