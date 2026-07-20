//
//  ProfileView.swift
//  Cash and Carry
//
//  Created by Edil on 17/07/2026.
//

import SwiftUI

struct ProfileView: View {

    @State private var showLogoutAlert = false
    
    @EnvironmentObject private var router: AppRouter
    
    @StateObject private var logoutVM = DIContainer.shared.makeLogoutViewModel()
    
    @EnvironmentObject private var profileVM: ProfileViewModel
        
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

                }
                .padding()
            }
        }
        .background(Color.white)
        .alert("Logout", isPresented: $showLogoutAlert) {

            Button("Cancel", role: .cancel) {}

            Button("Logout", role: .destructive) {
                // Logout
                Task {
                    logoutVM.logout()
                }
            }

        } message: {
            Text("Are you sure you want to logout?")
                .font(.custom("Outfit-Regular", size: 12))
        }
        .onChange(of: logoutVM.isLoggedOut) {_, isLoggedOut in
            if isLoggedOut {
                router.setRoot(.login)
            }
            
        }
        
        .overlay {
            if logoutVM.isLoading {
                ZStack {
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                    
                    VStack (spacing: 16) {
                        ProgressView()
                        
                        Text("Logging out...")
                            .font(.custom("Outfit-Medium", size: 16))
                    }
                    .padding(30)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}

private extension ProfileView {
    var profileHeader: some View {
        VStack {
            if profileVM.isLoading {
                ProgressView()
            } else if let profile = profileVM.profile {
                VStack(spacing: 8) {

                  ZStack {

                       Circle()
                            .fill(Color.black)
                            .frame(width: 80, height: 80)

                      Text(profileInitials(profile.name))
                            .font(.custom("Outfit-SemiBold", size: 26))
                            .foregroundColor(.white)
                            }

                           Text(profile.name)
                                .font(.custom("Outfit-SemiBold", size: 18))
                    
                    
                    if let email = profile.email, !email.isEmpty {
                        Text(email)
                                    .font(.custom("Outfit-Regular", size: 14))
                                    .foregroundColor(.gray)
                    }
                    

                            HStack(spacing: 10) {

                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)

                                Text(profile.isActive ? "Active Customer" : "Inactive Customer")
                                    .font(.custom("Outfit-Medium", size: 14))
                                    .foregroundColor(profile.isActive ? .green: .orange)
                            }
                            .padding(.horizontal, 24)
                            .frame(height: 46)
                            .background(profile.isActive ? Color.green.opacity(0.1) : .orange.opacity(0.1))
                            .clipShape(Capsule())
                        }
            }
                
        }
       
    }
    
    var accountInformation: some View {
        VStack {
            if profileVM.isLoading {
                ProgressView()
            } else if let profile = profileVM.profile {
                VStack(alignment: .leading, spacing: 24) {

                            Text("Account Information")
                                .font(.custom("Outfit-Medium", size: 16))

                            ProfileInfoRow(
                                icon: "phone",
                                title: "Phone Number",
                                value: profile.phone
                            )

                            ProfileInfoRow(
                                icon: "calendar",
                                title: "Member Since",
                                value: profile.createdAt.formattedDate()
                            )
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        
    }
    
    var preferences: some View {
        VStack(alignment: .leading, spacing: 18) {

                    Text("Preferences")
                        .font(.custom("Outfit-Medium", size: 16))

                    ProfileMenuRow(
                        icon: "square.and.pencil",
                        title: "Edit Profile"
                    ) {

                    }

                    ProfileMenuRow(
                        icon: "key",
                        title: "Change Password"
                    ) {
                        router.push(.changePassword)
                    }
            
                   ProfileMenuRow(
                      icon: "iphone.and.arrow.forward.outward",
                      title: "Logout",
                      isLogout: true
                   ) {
                       showLogoutAlert = true
                    }
                }
    }
    
    private func profileInitials(_ name: String) -> String {
        let components = name
            .split(separator: " ")
            .map { String($0) }

        if components.count >= 2 {
            return "\(components[0].prefix(1))\(components[1].prefix(1))"
                .uppercased()
        } else if let first = components.first {
            return String(first.prefix(2)).uppercased()
        }

        return ""
    }
}
