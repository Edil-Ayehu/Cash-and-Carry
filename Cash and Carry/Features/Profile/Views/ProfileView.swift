//
//  ProfileView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ProfileView: View {

    @State private var showLogoutAlert = false

    var body: some View {

        VStack(spacing: 0) {

            Text("Profile")
                .font(.custom("Outfit-Medium", size: 18))
                .padding(.top)

            ScrollView(showsIndicators: false) {

                VStack(spacing: 32) {
                    
                    Spacer().frame(height: 4)

                    profileHeader

                    accountInformation

                    preferences

                    Spacer(minLength: 20)

                    Button {
                        showLogoutAlert = true
                    } label: {

                        Text("Logout")
                            .font(.custom("Outfit-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.red)
                            .clipShape(Capsule())
                    }
                }
                .padding()
            }
        }
        .background(Color.white)
        .alert("Logout", isPresented: $showLogoutAlert) {

            Button("Cancel", role: .cancel) {}

            Button("Logout", role: .destructive) {
                // Logout
            }

        } message: {
            Text("Are you sure you want to logout?")
        }
    }
}

private extension ProfileView {
    var profileHeader: some View {
        VStack(spacing: 12) {

                    ZStack {

                        Circle()
                            .fill(Color.black)
                            .frame(width: 80, height: 80)

                        Text("ET")
                            .font(.custom("Outfit-SemiBold", size: 36))
                            .foregroundColor(.white)
                    }

                    Text("Edil Tade")
                        .font(.custom("Outfit-SemiBold", size: 18))

                    Text("luckyOne@gmail.com")
                        .font(.custom("Outfit-Regular", size: 14))
                        .foregroundColor(.gray)

                    HStack(spacing: 10) {

                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)

                        Text("Active Customer")
                            .font(.custom("Outfit-Medium", size: 14))
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 24)
                    .frame(height: 46)
                    .background(Color.green.opacity(0.1))
                    .clipShape(Capsule())
                }
    }
    
    var accountInformation: some View {
        VStack(alignment: .leading, spacing: 24) {

                    Text("Account Information")
                        .font(.custom("Outfit-Medium", size: 18))

                    ProfileInfoRow(
                        icon: "phone",
                        title: "Phone Number",
                        value: "+27930884402"
                    )

                    ProfileInfoRow(
                        icon: "calendar",
                        title: "Member Since",
                        value: "Jun 10, 2026"
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var preferences: some View {
        VStack(alignment: .leading, spacing: 18) {

                    Text("Preferences")
                        .font(.custom("Outfit-Medium", size: 18))

                    ProfileMenuRow(
                        icon: "square.and.pencil",
                        title: "Edit Profile"
                    ) {

                    }

                    ProfileMenuRow(
                        icon: "key",
                        title: "Change Password"
                    ) {

                    }
                }
    }
}
