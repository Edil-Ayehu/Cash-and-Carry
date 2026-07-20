import SwiftUI

struct LoginView: View {

    @State private var phone = "930884422"
    @State private var password = "123456"
    
    @EnvironmentObject private var router: AppRouter
    
    
    @StateObject private var loginVM = DIContainer.shared.makeLoginViewModel()
    
    var isFormValid: Bool {
        !phone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        phone.count >= 9 &&
        !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            password.count >= 6
    }
    

    var body: some View {

        ZStack() {

            // White background
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                Spacer()
                
                AuthHeader(
                    title: "Welcome Back",
                    subtitle: "Sign in to discover products from multiple stores and pre-order with ease"
                )
                
                Spacer().frame(height: 18)

                // MARK: Form

                VStack(spacing: 22) {

                    CountryCodePicker(phone: $phone)

                    AppSecureField(
                        title: "Password",
                        text: $password
                    )

                    HStack {

                        Spacer()
                        
                        Button{
                            router.push(.forgotPassword)
                        } label: {
                            Text("Forgot Password?")
                                .font(.custom("Outfit-SemiBold", size: 16))
                                .foregroundColor(Color.cyan)
                        }

                    }
                    
                    Spacer().frame(height: 6)

                    
                    PrimaryButton(
                        title: "Sign In",
                        isLoading: loginVM.isLoading,
                        isEnabled: isFormValid,
                        action: _handleLogin
                    )

                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Spacer().frame(height: 30)

                

                HStack(spacing: 5) {

                    Text("Don't have an account?")
                        .font(.custom("Outfit-Regular", size: 16))
                        .foregroundColor(.gray)
                    
                    Button {
                        router.push(.register)
                    } label: {
                        Text("Sign Up")
                            .font(.custom("Outfit-Bold", size: 16))
                            .foregroundColor(Color.cyan)
                    }

                }
                .padding(.bottom, 35)
                
                Spacer()

            }

        }
        .alert("Error", isPresented: Binding(
            get: {loginVM.errorMessage != nil},
            set: {_ in loginVM.errorMessage = nil}
        )) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(loginVM.errorMessage ?? "Something went wrong. Please try again later.")
                .font(.custom("Outfit-Regular", size: 14))
        }
        
        .onChange(of: loginVM.isLoggedIn) { _, isLoggedIn in
            if isLoggedIn {
                router.setRoot(.mainTab)
            }
        }

    }
    
    func _handleLogin() {
        let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedPhone.isEmpty else {
            loginVM.errorMessage = "Please enter your phone number."
            return
        }
        
        guard !password.isEmpty else {
            loginVM.errorMessage = "Please enter your password."
            return
        }
        
        guard password.count >= 6 else {
              loginVM.errorMessage = "Password must be at least 6 characters long."
                return
            }
        
        Task {
            await loginVM.login(phone: phone, password: password)
        }
    }

}
