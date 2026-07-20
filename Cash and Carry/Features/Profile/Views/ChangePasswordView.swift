//
//  ChangePasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI
import AlertToast

struct ChangePasswordView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var changePasswordVM = DIContainer.shared.makeChangePasswordViewModel()
    
    @State private var showSuccessToast: Bool = false
    
    private var isFormValid: Bool {
        oldPassword.count >= 6 &&
        newPassword.count >= 6
    }

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
                isLoading: changePasswordVM.isLoading,
                isEnabled: isFormValid,
                action: _handleChangePassword
                
            )
            .padding()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
        .onChange(of: changePasswordVM.passwordChanged) {_, passwordChanged in
            if passwordChanged {
                showSuccessToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    router.pop()
                }
            }
        }
        .alert("Error", isPresented: Binding(
            get: { changePasswordVM.errorMessage != nil},
            set: { _ in changePasswordVM.errorMessage = nil}
        )) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(changePasswordVM.errorMessage ?? "Something went wrong.")
        }
        
        .toast(isPresenting: $showSuccessToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Password changed successfully!"
            )
        }
    }
    
    func _handleChangePassword() {
        guard newPassword.count >= 6 else {
            changePasswordVM.errorMessage = "Password must be at least 6 characters long."
            return
        }
        
        guard newPassword != oldPassword else {
            changePasswordVM.errorMessage = "New password must be different from old password."
            return
        }
        
        guard newPassword == confirmPassword else {
            changePasswordVM.errorMessage = "Passwords do not match."
            return
        }
        
        Task {
            await changePasswordVM.changePassword(
                oldPassword: oldPassword,
                newPassword: newPassword
            )
        }
    }
}

