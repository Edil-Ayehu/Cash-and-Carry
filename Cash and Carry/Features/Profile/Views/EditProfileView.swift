//
//  EditProfileView.swift
//  Cash and Carry
//
//  Created by Edil on 26/07/2026.
//

import SwiftUI
import AlertToast

struct EditProfileView: View {
    
    let profile: ProfileResponse

    @Environment(\.dismiss) private var dismiss
    

    @State private var fullName: String
    @State private var email: String
    @State private var phone: String
    
    @StateObject private var editProfileVM = DIContainer.shared.makeEditProfileViewModel()
    
    @State private var showSuccessToast : Bool = false
    
    @EnvironmentObject private var router: AppRouter
    
    init(profile: ProfileResponse) {
        self.profile = profile
        
        _fullName = State(initialValue: profile.name)
        _email = State(initialValue: profile.email ?? "")
        _phone = State(initialValue: profile.phone)
    }
    
    var isFormValid: Bool {
        !profile.name.isEmpty
    }

    var body: some View {

        VStack(spacing: 0) {

            header

            ScrollView(showsIndicators: false) {

                VStack(spacing: 28) {

                    profileImage

                    VStack(spacing: 22) {

                        floatingField(
                            title: "Full Name",
                            text: $fullName
                        )

                        floatingField(
                            title: "Email Address",
                            text: $email
                        )

                        floatingField(
                            title: "Phone Number",
                            text: $phone,
                            isReadOnly: true
                        )
                    }
                }
                .padding()
            }

            PrimaryButton(
                title: "Save Changes",
                isLoading: editProfileVM.isLoading,
                isEnabled: isFormValid,
                height: 54,
                action: _handleChange
            )
            .padding()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden()
        .onChange(of: editProfileVM.isEdited) { _, isEdited in
            if isEdited {
                showSuccessToast = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    router.pop()
                }
            }
        }
        .toast(isPresenting: $showSuccessToast) {
            AlertToast(
                displayMode: .hud,
                type: .complete(.green),
                title: "Profile updated successfully"
            )
        }
        .alert("Error", isPresented: Binding(
            get: {editProfileVM.errorMessage != nil},
            set: { _ in editProfileVM.errorMessage = nil}
        )) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(editProfileVM.errorMessage ?? "Something went wrong.")
        }
    }
    
    func _handleChange() {
        guard !fullName.isEmpty else {
            editProfileVM.errorMessage = "Full name is required"
            return
        }
        
        Task {
            await editProfileVM.editProfile(name: fullName, email: email)
        }
    }
}

private extension EditProfileView {

    var header: some View {

        HStack {

            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 22, weight: .medium))
            }
            
            Spacer()

            Text("Edit Profile")
                .font(.custom("Outfit-Medium", size: 16))

            Spacer()
        }
        .foregroundColor(.black)
        .padding()
    }
    
    var profileImage: some View {

            ZStack(alignment: .bottomTrailing) {

                Circle()
                    .fill(Color(.systemGray6))
                    .frame(width: 110, height: 110)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.black)
                    )

                Button {

                    // Pick image

                } label: {

                    Circle()
                        .fill(Color.black)
                        .frame(width: 36, height: 36)
                        .overlay(
                            Image(systemName: "camera.fill")
                                .foregroundColor(.white)
                        )
                }
            }
        }
    
    func floatingField(
            title: String,
            text: Binding<String>,
            isReadOnly: Bool = false
        ) -> some View {

            ZStack(alignment: .topLeading) {

                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.gray.opacity(0.25))
                    .frame(height: 72)

                Text(title)
                    .font(.custom("Outfit-Regular", size: 13))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .offset(x: 18, y: -9)

                TextField("", text: text)
                    .disabled(isReadOnly ? true: false)
                    .font(.custom("Outfit-Regular", size: 18))
                    .foregroundColor(isReadOnly ? .gray : .black)
                    .padding(.horizontal, 18)
                    .frame(height: 72)
            }
        }
    
    
}
