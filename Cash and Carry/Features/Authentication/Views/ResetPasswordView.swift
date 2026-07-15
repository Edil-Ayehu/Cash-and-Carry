//
//  ResetPasswordView.swift
//  Cash and Carry
//
//  Created by Edil on 15/07/2026.
//

import SwiftUI

struct ResetPasswordView: View {

    @State private var verificationCode = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                // MARK: Header

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

                    PrimaryButton(title: "Reset Password") {

                        // API Call
                        // router.push(.login)

                    }

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

                    }

                }
                .padding(.bottom, 35)

            }

        }
        .navigationBarBackButtonHidden()
    }
}
